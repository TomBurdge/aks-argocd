terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.44.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1"
    }
  }
  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  subscription_id = "4d292c0a-30e5-40df-9b2a-14e7972c6c03"
}

provider "azuread" {
  tenant_id = data.azurerm_client_config.current.tenant_id
}

provider "random" {}
