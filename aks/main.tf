terraform {
  backend "azure" {}
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}
resource "azurerm_virtual_network" "main" {
  name                = "virtual-network"
  address_space       = ["10.0.0.0/16"]
  location            = "East US"
  resource_group_name = "RG-Container"
}
resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = "RG-Container"
  virtual_network_name = "virtual-network"
  address_prefixes     = ["10.0.2.0/24"]
}

