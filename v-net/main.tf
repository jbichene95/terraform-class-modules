resource "azurerm_virtual_network" "v-net" {
  name                = var.net-name
  address_space       = var.net-add-space
  location            = var.net-location
  resource_group_name = var.rg-name
}

resource "azurerm_subnet" "app-test" {
  name                 = var.subnet-name
  resource_group_name  = var.rg-name
  virtual_network_name = azurerm_virtual_network.v-net.name
  address_prefixes     = var.subnet-prefixes
}