terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.21.1"
    }
  }
}
provider "azurerm" {
    features {}
 subscription_id = "888a284a-9960-4d55-a795-66d32ef50b12"
}




resource "azurerm_resource_group" "main" {
   name = "TestTF"
   location = "North Europe"
}

