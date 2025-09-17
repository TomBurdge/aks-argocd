data "azurerm_client_config" "current" {}

data "azuread_client_config" "current" {}

resource "azuread_group" "aks_admin" {
  display_name     = upper("${var.cluster_name}-aks-admin")
  description      = "${var.cluster_name} AKS Administrator group"
  security_enabled = true
  owners           = [data.azuread_client_config.current.object_id]
  members          = [data.azuread_client_config.current.object_id]
}

# Needed for kubectl-ing around in the cluster
resource "azurerm_role_assignment" "admin_assignment" {
  scope                = azurerm_kubernetes_cluster.this.id
  role_definition_name = "Azure Kubernetes Service RBAC Cluster Admin"
  principal_id         = azuread_group.aks_admin.object_id
}

resource "azurerm_kubernetes_cluster" "this" {
  name                = "${var.cluster_name}aks"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "kuberadagt"
  sku_tier            = "Free"

  default_node_pool {
    auto_scaling_enabled = true
    name                 = "default"
    # Set to non HA and only 1 node because of current cpu quotas (could just request to increase the quota)
    # Docs state that HA must be at least 3 nodes
    # https://learn.microsoft.com/en-us/azure/azure-arc/kubernetes/tutorial-use-gitops-argocd#azure-kubernetes-service-clusters
    min_count = 3
    max_count = 5
    max_pods  = 30
    # TODO: explore making F when http/https works
    node_public_ip_enabled = true
    vm_size                = "standard_d2_v3"

    temporary_name_for_rotation = "rotatingpool"
  }

  # The below is needed because according to the docs: 
  # kube_admin_config - A kube_admin_config block as defined below. This is only available when Role Based Access Control with Azure Active Directory is enabled and local accounts enabled.
  # And I want to use kube_admin_config to deploy argo manifests with the provider
  #
  # This could be more enterprise grade by using kube_config
  local_account_disabled = false
  azure_active_directory_role_based_access_control {
    azure_rbac_enabled     = true
    tenant_id              = data.azurerm_client_config.current.tenant_id
    admin_group_object_ids = [azuread_group.aks_admin.object_id]
  }

  monitor_metrics {
    annotations_allowed = "prometheus.io/scrape,prometheus.io/port,prometheus.io/path"
    labels_allowed      = "app,app.kubernetes.io/name,app.kubernetes.io/component,app.kubernetes.io/instance,k8s-app,env"
  }

  # According to docs, aks must be (System Assigned) Managed Service Identity for ArgoCD extension
  # (not SPN)
  # https://learn.microsoft.com/en-us/azure/azure-arc/kubernetes/tutorial-use-gitops-argocd#azure-kubernetes-service-clusters
  identity {
    type = "SystemAssigned"
  }

  web_app_routing {
    dns_zone_ids = [var.dns_zone_id]

    default_nginx_controller = "External"
  }
}

# This appears to be needed for the AKS to be able to use the DNS Zone
# see line 47: https://github.com/rceraline/devops/blob/main/2025-05-aks-web-app-addon/main.tf
resource "azurerm_role_assignment" "web_app_routing_dns_zone" {
  scope                = var.dns_zone_id
  role_definition_name = "DNS Zone Contributor"
  principal_id         = azurerm_kubernetes_cluster.this.web_app_routing[0].web_app_routing_identity[0].object_id
}

resource "azurerm_kubernetes_cluster_extension" "argocd" {
  # TODO: add namespace install

  # TODO: can add validate block to the module for no. of nodes for whether is HA/not
  name           = "argocd-ext"
  cluster_id     = azurerm_kubernetes_cluster.this.id
  extension_type = "microsoft.argocd"
  release_train  = "preview"
  configuration_settings = {
    deployWithHighAvailability = "false"
    namespaceInstall           = "false"
  }
}

# TODO: terraform helm for prometheus ArgoCD application (should always be in the module)
# TODO: helm for application (basic NGINX default first)
