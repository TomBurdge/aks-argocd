locals {
  location="uksouth"
}

remote_state {
  backend="azurerm"
  generate = {
    path = "backend.tf"
    if_exists="overwrite_terragrunt"
  }
  config = {
    resource_group_name  = "tfState"
    storage_account_name = "tfstatetbplaygroundukssa"
    container_name       = "statefiles"
    key                  = "${path_relative_to_include()}/terraform.tfstate"
    tenant_id            = "985cea08-5ec2-484f-b50d-71ecaa34024d"
    subscription_id      = "4d292c0a-30e5-40df-9b2a-14e7972c6c03"

  }
}

terraform_binary = "terraform"
