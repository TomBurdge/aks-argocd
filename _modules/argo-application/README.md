## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.38.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | ~> 2.38.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_manifest.application](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | n/a | `string` | n/a | yes |
| <a name="input_app_namespace"></a> [app\_namespace](#input\_app\_namespace) | n/a | `string` | n/a | yes |
| <a name="input_destination_ns"></a> [destination\_ns](#input\_destination\_ns) | n/a | `string` | n/a | yes |
| <a name="input_helm_value_files"></a> [helm\_value\_files](#input\_helm\_value\_files) | n/a | `list(string)` | `[]` | no |
| <a name="input_path"></a> [path](#input\_path) | n/a | `string` | n/a | yes |
| <a name="input_repo_url"></a> [repo\_url](#input\_repo\_url) | n/a | `string` | n/a | yes |
| <a name="input_target_revision"></a> [target\_revision](#input\_target\_revision) | n/a | `string` | `"HEAD"` | no |

## Outputs

No outputs.
