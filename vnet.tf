resource "azurerm_virtual_network" "vnet01" {
  name                = var.vnet01[0].name
  address_space       = [var.vnet01[0].address_space]
  location            = azurerm_resource_group.rg01.location
  resource_group_name = azurerm_resource_group.rg01.name
}
