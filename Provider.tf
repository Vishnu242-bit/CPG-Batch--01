terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.29.0"
    }
  }
}


provider "azurerm" {
  features {}
  subscription_id = "c3dc5168-3885-45f2-b30f-ddde740a1064"
}
  
  