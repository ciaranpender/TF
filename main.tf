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




resource "azurerm_resource_group" "AZDevops" {
  name     = "AZDevops"
  location = "West Europe"
}

resource "azurerm_network_security_group" "AZDevopsNSG" {
  name                = "AZDevopsNSG"
  location            = "North Europe"
  resource_group_name = "AZDevops"
}

resource "azurerm_virtual_network" "AZDevopsVnet" {
  name                = "AZDevopsVnet"
  location            = "North Europe"
  resource_group_name = "AZDevops"
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name             = "subnet1"
    address_prefixes = ["10.0.1.0/24"]
  }

  subnet {
    name             = "subnet2"
    address_prefixes = ["10.0.2.0/24"]
    security_group   = azurerm_network_security_group.AZDevopsNSG.id
  }

  tags = {
    environment = "Production"
  }
}
