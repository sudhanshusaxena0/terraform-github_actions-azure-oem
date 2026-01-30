resource "azurerm_storage_account" "stgacctoem01" {
  name                            = var.stgacctoem01[0].name
  resource_group_name             = azurerm_resource_group.rg01.name
  location                        = azurerm_resource_group.rg01.location
  account_tier                    = var.stgacctoem01[0].account_tier
  account_replication_type        = var.stgacctoem01[0].account_replication_type
  account_kind                    = var.stgacctoem01[0].account_kind
  is_hns_enabled                  = var.stgacctoem01[0].is_hns_enabled
  nfsv3_enabled                   = var.stgacctoem01[0].nfsv3_enabled
  public_network_access_enabled   = var.stgacctoem01[0].public_network_access_enabled
  https_traffic_only_enabled      = var.stgacctoem01[0].https_traffic_only_enabled
  allow_nested_items_to_be_public = var.stgacctoem01[0].allow_nested_items_to_be_public
}

resource "azurerm_storage_share" "nfs01" {
  name               = var.nfs01[0].name
  storage_account_id = azurerm_storage_account.stgacctoem01.id
  quota              = var.nfs01[0].quota
  enabled_protocol   = var.nfs01[0].enabled_protocol
}

resource "azurerm_private_endpoint" "private-endpoint01" {
  name                = var.private-endpoint01[0].name
  location            = azurerm_resource_group.rg01.location
  resource_group_name = azurerm_resource_group.rg01.name
  subnet_id           = azurerm_subnet.vm-subnet01.id

  private_service_connection {
    name                           = var.private-endpoint01[0].private_service_connection_name
    private_connection_resource_id = azurerm_storage_account.stgacctoem01.id
    subresource_names              = [var.private-endpoint01[0].subresource_names]
    is_manual_connection           = var.private-endpoint01[0].is_manual_connection
  }

  private_dns_zone_group {
    name                 = var.private-endpoint01[0].private_dns_zone_group_name
    private_dns_zone_ids = [azurerm_private_dns_zone.private-dns-zone01.id]
  }

  ip_configuration {
    name               = var.private-endpoint01[0].ip_configuration_name
    private_ip_address = var.private-endpoint01[0].private_ip_address
    subresource_name   = var.private-endpoint01[0].subresource_name
  }
}

resource "azurerm_private_dns_zone" "private-dns-zone01" {
  name                = var.private-dns-zone01
  resource_group_name = azurerm_resource_group.rg01.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "private-dns-zone-virtual-network-link01" {
  name                  = var.private-dns-zone-virtual-network-link01
  resource_group_name   = azurerm_resource_group.rg01.name
  private_dns_zone_name = azurerm_private_dns_zone.private-dns-zone01.name
  virtual_network_id    = azurerm_virtual_network.vnet01.id
}

resource "azurerm_private_dns_a_record" "private-dns-record01" {
  name                = azurerm_storage_share.nfs01.name
  zone_name           = azurerm_private_dns_zone.private-dns-zone01.name
  resource_group_name = azurerm_resource_group.rg01.name
  ttl                 = var.private-dns-record01-ttl
  records             = [azurerm_private_endpoint.private-endpoint01.private_service_connection.0.private_ip_address]
}
