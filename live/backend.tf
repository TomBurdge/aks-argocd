terraform {
  backend "azurerm" {
    resource_group_name  = "tfState"
    storage_account_name = "tfstatetbplaygroundukssa"
    container_name       = "statefiles"
    key                  = "aks-argo.tfstate"
    tenant_id            = "985cea08-5ec2-484f-b50d-71ecaa34024d"
    subscription_id      = "4d292c0a-30e5-40df-9b2a-14e7972c6c03"
  }
}
