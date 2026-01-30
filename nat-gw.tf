resource "azurerm_nat_gateway" "nat-gw01" {
  name                    = var.nat-gw01[0].name
  location                = azurerm_resource_group.rg01.location
  resource_group_name     = azurerm_resource_group.rg01.name
  sku_name                = var.nat-gw01[0].sku_name
  idle_timeout_in_minutes = var.nat-gw01[0].idle_timeout_in_minutes
}

resource "azurerm_public_ip" "nat-gw01-ip" {
  name                = var.nat-gw01-ip[0].name
  location            = azurerm_resource_group.rg01.location
  resource_group_name = azurerm_resource_group.rg01.name
  sku                 = var.nat-gw01-ip[0].sku
  allocation_method   = var.nat-gw01-ip[0].allocation_method
}

resource "azurerm_nat_gateway_public_ip_association" "nat-gw01-ip-association" {
  nat_gateway_id       = azurerm_nat_gateway.nat-gw01.id
  public_ip_address_id = azurerm_public_ip.nat-gw01-ip.id
}

resource "azurerm_subnet_nat_gateway_association" "nat-gw01-subnet-association" {
  subnet_id      = azurerm_subnet.vm-subnet01.id
  nat_gateway_id = azurerm_nat_gateway.nat-gw01.id
}
