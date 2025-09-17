# azure monitor workspace for prometheus
resource "azurerm_monitor_workspace" "prometheus" {
  name                = "prometheus-istio-aks"
  location            = var.location
  resource_group_name = var.resource_group_name
}

# data collection endpoint for prometheus
resource "azurerm_monitor_data_collection_endpoint" "dataCollectionEndpoint" {
  name                = "MSProm-EUS-istio-aks"
  resource_group_name = var.resource_group_name
  location            = var.location
  kind                = "Linux"
}

resource "azurerm_monitor_data_collection_rule" "dataCollectionRule" {
  name                        = "MSProm-EUS-istio-aks"
  resource_group_name         = var.resource_group_name
  location                    = var.location
  data_collection_endpoint_id = azurerm_monitor_data_collection_endpoint.dataCollectionEndpoint.id
  kind                        = "Linux"
  destinations {
    monitor_account {
      monitor_account_id = azurerm_monitor_workspace.prometheus.id
      name               = "MonitoringAccount1"
    }
  }
  data_flow {
    streams      = ["Microsoft-PrometheusMetrics"]
    destinations = ["MonitoringAccount1"]
  }
  data_sources {
    prometheus_forwarder {
      streams = ["Microsoft-PrometheusMetrics"]
      name    = "PrometheusDataSource"
    }
  }
  description = "DCR for Azure Monitor Metrics Profile (Managed Prometheus)"
  depends_on = [
    azurerm_monitor_data_collection_endpoint.dataCollectionEndpoint
  ]
}

# associate our AKS cluster with this Azure Monitor workspace using the Data Collection Endpoint and Rule

resource "azurerm_monitor_data_collection_rule_association" "dataCollectionRuleAssociation" {
  name                    = "MSProm-EUS-istio-aks"
  target_resource_id      = var.aks_id
  data_collection_rule_id = azurerm_monitor_data_collection_rule.dataCollectionRule.id
  description             = "Association of data collection rule. Deleting this association will break the data collection for this AKS Cluster."
  depends_on = [
    azurerm_monitor_data_collection_rule.dataCollectionRule
  ]
}

# Random suffix for the grafa dashboard name
resource "random_id" "grafana" {
  byte_length = 6
}

resource "azurerm_dashboard_grafana" "this" {
  name                              = "grafana-${random_id.grafana.hex}"
  resource_group_name               = var.resource_group_name
  location                          = var.location
  api_key_enabled                   = true
  deterministic_outbound_ip_enabled = true
  public_network_access_enabled     = true
  grafana_major_version             = "11"

  azure_monitor_workspace_integrations {
    resource_id = azurerm_monitor_workspace.prometheus.id
  }

  identity {
    type = "SystemAssigned"
  }
}

data "azurerm_subscription" "current" {}

# Give Managed Grafana instances access to read monitoring data in current subscription.
resource "azurerm_role_assignment" "monitoring_reader" {
  scope                = data.azurerm_subscription.current.id
  role_definition_name = "Monitoring Reader"
  principal_id         = azurerm_dashboard_grafana.this.identity[0].principal_id
}

# https://learn.microsoft.com/en-us/azure/azure-monitor/essentials/prometheus-grafana
resource "azurerm_role_assignment" "monitoring_data_reader" {
  scope                = var.resource_group_id
  role_definition_name = "Monitoring Data Reader"
  principal_id         = azurerm_dashboard_grafana.this.identity[0].principal_id
}

data "azurerm_client_config" "current" {}

# Give current client admin access to Managed Grafana instance.
resource "azurerm_role_assignment" "grafana_admin" {
  scope                = azurerm_dashboard_grafana.this.id
  role_definition_name = "Grafana Admin"
  principal_id         = data.azurerm_client_config.current.object_id
}
