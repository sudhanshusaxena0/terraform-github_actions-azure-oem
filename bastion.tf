resource "azurerm_subnet" "bastion-subnet01" {
  name                 = var.bastion-subnet01[0].name
  resource_group_name  = azurerm_resource_group.rg01.name
  virtual_network_name = azurerm_virtual_network.vnet01.name
  address_prefixes     = [var.bastion-subnet01[0].address_prefixes]
}

resource "azurerm_public_ip" "bastion-host01-ip" {
  name                = var.bastion-host01-ip[0].name
  location            = azurerm_resource_group.rg01.location
  resource_group_name = azurerm_resource_group.rg01.name
  sku                 = var.bastion-host01-ip[0].sku
  allocation_method   = var.bastion-host01-ip[0].allocation_method
}

resource "azurerm_bastion_host" "bastion-host01" {
  name                = var.bastion-host01[0].name
  location            = azurerm_resource_group.rg01.location
  resource_group_name = azurerm_resource_group.rg01.name
  ip_configuration {
    name                 = var.bastion-host01[0].ipconfig_name
    subnet_id            = azurerm_subnet.bastion-subnet01.id
    public_ip_address_id = azurerm_public_ip.bastion-host01-ip.id
  }
}
