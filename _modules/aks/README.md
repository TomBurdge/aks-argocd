## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | 3.5.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 4.44.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | 3.5.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.44.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azuread_group.aks_admin](https://registry.terraform.io/providers/hashicorp/azuread/3.5.0/docs/resources/group) | resource |
| [azurerm_kubernetes_cluster.this](https://registry.terraform.io/providers/hashicorp/azurerm/4.44.0/docs/resources/kubernetes_cluster) | resource |
| [azurerm_kubernetes_cluster_extension.argocd](https://registry.terraform.io/providers/hashicorp/azurerm/4.44.0/docs/resources/kubernetes_cluster_extension) | resource |
| [azurerm_role_assignment.admin_assignment](https://registry.terraform.io/providers/hashicorp/azurerm/4.44.0/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.web_app_routing_dns_zone](https://registry.terraform.io/providers/hashicorp/azurerm/4.44.0/docs/resources/role_assignment) | resource |
| [azuread_client_config.current](https://registry.terraform.io/providers/hashicorp/azuread/3.5.0/docs/data-sources/client_config) | data source |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/4.44.0/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | AKS cluster name | `string` | n/a | yes |
| <a name="input_dns_zone_id"></a> [dns\_zone\_id](#input\_dns\_zone\_id) | n/a | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location of the resource group. | `string` | `"uksouth"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_kube_admin_client_certificate"></a> [kube\_admin\_client\_certificate](#output\_kube\_admin\_client\_certificate) | n/a |
| <a name="output_kube_admin_client_key"></a> [kube\_admin\_client\_key](#output\_kube\_admin\_client\_key) | n/a |
| <a name="output_kube_admin_cluster_ca_certificate"></a> [kube\_admin\_cluster\_ca\_certificate](#output\_kube\_admin\_cluster\_ca\_certificate) | n/a |
| <a name="output_kube_admin_host"></a> [kube\_admin\_host](#output\_kube\_admin\_host) | n/a |
