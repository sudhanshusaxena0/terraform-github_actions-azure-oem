resource "azurerm_recovery_services_vault" "backup-vault01" {
  name                = var.backup-vault01[0].name
  resource_group_name = azurerm_resource_group.rg01.name
  location            = azurerm_resource_group.rg01.location
  sku                 = var.backup-vault01[0].sku
}

resource "azurerm_backup_policy_vm" "backup-policy01" {
  name                = var.backup-policy01[0].name
  resource_group_name = azurerm_resource_group.rg01.name
  recovery_vault_name = azurerm_recovery_services_vault.backup-vault01.name

  timezone = var.backup-policy01[0].timezone

  backup {
    frequency = var.backup-policy01[0].frequency
    time      = var.backup-policy01[0].time
  }

  retention_daily {
    count = var.backup-policy01[0].count
  }
}

resource "azurerm_backup_protected_vm" "backup-oem01" {
  resource_group_name = azurerm_resource_group.rg01.name
  recovery_vault_name = azurerm_recovery_services_vault.backup-vault01.name
  source_vm_id        = var.oem01-source-id
  backup_policy_id    = azurerm_backup_policy_vm.backup-policy01.id
}

resource "azurerm_backup_protected_vm" "backup-oem02" {
  resource_group_name = azurerm_resource_group.rg01.name
  recovery_vault_name = azurerm_recovery_services_vault.backup-vault01.name
  source_vm_id        = var.oem02-source-id
  backup_policy_id    = azurerm_backup_policy_vm.backup-policy01.id
}

resource "azurerm_backup_protected_vm" "backup-oemrepo01" {
  resource_group_name = azurerm_resource_group.rg01.name
  recovery_vault_name = azurerm_recovery_services_vault.backup-vault01.name
  source_vm_id        = var.oemrepo01-source-id
  backup_policy_id    = azurerm_backup_policy_vm.backup-policy01.id
}
