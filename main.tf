terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}


resource "azurerm_resource_group" "test" {
  name     = "isreal"
  location = "West Europe"
}
module "vnet"{
    source = "./v-net"
    net-name = "isreal-net"
    net-add-space = ["10.0.0.0/8"]
    net-location = "eastus"
    rg-name = "isreal-grp"
    subnet-name = "app"
    subnet-prefixes = ["10.1.0.0/16"]

}
module "vm-module" {
  source = "./vm-module"
  nic-name = "net-card"
 
  rg-location = "eastus"
  subnet_id = module.vnet.subnet-id
  vm-name = "israel-vm"
  rg-name = "isreal-grp"
  username = "adminuser"
  
  
}