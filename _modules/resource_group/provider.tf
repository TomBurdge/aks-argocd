provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  # TODO: pass via terragrunt root and overwrite provider
  subscription_id = "4d292c0a-30e5-40df-9b2a-14e7972c6c03"
}

