terraform {
  backend "azurerm" {
    resource_group_name  = "sohit-rg"
    storage_account_name = "sohittfstate001"
    container_name       = "tfstate"
    key                  = "dev.tfstate"
  }
}
