## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 4.44.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.44.0 |
| <a name="provider_random"></a> [random](#provider\_random) | ~> 3.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_dashboard_grafana.this](https://registry.terraform.io/providers/hashicorp/azurerm/4.44.0/docs/resources/dashboard_grafana) | resource |
| [azurerm_monitor_data_collection_endpoint.dataCollectionEndpoint](https://registry.terraform.io/providers/hashicorp/azurerm/4.44.0/docs/resources/monitor_data_collection_endpoint) | resource |
| [azurerm_monitor_data_collection_rule.dataCollectionRule](https://registry.terraform.io/providers/hashicorp/azurerm/4.44.0/docs/resources/monitor_data_collection_rule) | resource |
| [azurerm_monitor_data_collection_rule_association.dataCollectionRuleAssociation](https://registry.terraform.io/providers/hashicorp/azurerm/4.44.0/docs/resources/monitor_data_collection_rule_association) | resource |
| [azurerm_monitor_workspace.prometheus](https://registry.terraform.io/providers/hashicorp/azurerm/4.44.0/docs/resources/monitor_workspace) | resource |
| [azurerm_role_assignment.grafana_admin](https://registry.terraform.io/providers/hashicorp/azurerm/4.44.0/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.monitoring_data_reader](https://registry.terraform.io/providers/hashicorp/azurerm/4.44.0/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.monitoring_reader](https://registry.terraform.io/providers/hashicorp/azurerm/4.44.0/docs/resources/role_assignment) | resource |
| [random_id.grafana](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/4.44.0/docs/data-sources/client_config) | data source |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/4.44.0/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aks_id"></a> [aks\_id](#input\_aks\_id) | n/a | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | n/a | yes |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | n/a | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
