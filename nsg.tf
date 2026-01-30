resource "azurerm_network_security_group" "nsg01" {
  name                = var.nsg01
  location            = azurerm_resource_group.rg01.location
  resource_group_name = azurerm_resource_group.rg01.name
}

resource "azurerm_subnet_network_security_group_association" "nsg01-association" {
  subnet_id                 = azurerm_subnet.vm-subnet01.id
  network_security_group_id = azurerm_network_security_group.nsg01.id
}
