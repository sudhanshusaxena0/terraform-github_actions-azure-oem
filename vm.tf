resource "azurerm_subnet" "vm-subnet01" {
  name                 = var.vm-subnet01[0].name
  resource_group_name  = azurerm_resource_group.rg01.name
  virtual_network_name = azurerm_virtual_network.vnet01.name
  address_prefixes     = [var.vm-subnet01[0].address_prefixes]
}

resource "azurerm_network_interface" "oemrepo01-nic" {
  name                = var.oemrepo01-nic[0].name
  location            = azurerm_resource_group.rg01.location
  resource_group_name = azurerm_resource_group.rg01.name

  ip_configuration {
    name                          = var.oemrepo01-nic[0].ipconfig_name
    subnet_id                     = azurerm_subnet.vm-subnet01.id
    private_ip_address_allocation = var.oemrepo01-nic[0].private_ip_address_allocation
    private_ip_address_version    = var.oemrepo01-nic[0].private_ip_address_version
    private_ip_address            = var.oemrepo01-nic[0].private_ip_address
  }
}

resource "azurerm_network_interface" "oem01-nic" {
  name                = var.oem01-nic[0].name
  location            = azurerm_resource_group.rg01.location
  resource_group_name = azurerm_resource_group.rg01.name

  ip_configuration {
    name                          = var.oem01-nic[0].ipconfig_name
    subnet_id                     = azurerm_subnet.vm-subnet01.id
    private_ip_address_allocation = var.oem01-nic[0].private_ip_address_allocation
    private_ip_address_version    = var.oem01-nic[0].private_ip_address_version
    private_ip_address            = var.oem01-nic[0].private_ip_address
  }
}

resource "azurerm_network_interface" "oem02-nic" {
  name                = var.oem02-nic[0].name
  location            = azurerm_resource_group.rg01.location
  resource_group_name = azurerm_resource_group.rg01.name

  ip_configuration {
    name                          = var.oem02-nic[0].ipconfig_name
    subnet_id                     = azurerm_subnet.vm-subnet01.id
    private_ip_address_allocation = var.oem02-nic[0].private_ip_address_allocation
    private_ip_address_version    = var.oem02-nic[0].private_ip_address_version
    private_ip_address            = var.oem02-nic[0].private_ip_address
  }
}

resource "azurerm_virtual_machine" "oemrepo01" {
  name                  = var.oemrepo01[0].name
  location              = azurerm_resource_group.rg01.location
  resource_group_name   = azurerm_resource_group.rg01.name
  network_interface_ids = [azurerm_network_interface.oemrepo01-nic.id]
  vm_size               = var.oemrepo01[0].vm_size
  zones                 = [var.oemrepo01[0].zones]

  delete_os_disk_on_termination = var.oemrepo01[0].delete_os_disk_on_termination

  delete_data_disks_on_termination = var.oemrepo01[0].delete_data_disks_on_termination

  storage_image_reference {
    id = var.oemrepo01[0].image_id
  }

  storage_os_disk {
    name              = var.oemrepo01[0].os_disk_name
    caching           = var.oemrepo01[0].caching
    create_option     = var.oemrepo01[0].create_option
    managed_disk_type = var.oemrepo01[0].managed_disk_type
  }

  os_profile {
    computer_name  = var.oemrepo01[0].computer_name
    admin_username = var.oemrepo01[0].admin_username
  }

  os_profile_linux_config {
    disable_password_authentication = var.oemrepo01[0].disable_password_authentication
    ssh_keys {
      path     = var.oemrepo01[0].path
      key_data = file(var.oemrepo01[0].key_data)
    }
  }
}

resource "azurerm_virtual_machine" "oem01" {
  name                  = var.oem01[0].name
  location              = azurerm_resource_group.rg01.location
  resource_group_name   = azurerm_resource_group.rg01.name
  network_interface_ids = [azurerm_network_interface.oem01-nic.id]
  vm_size               = var.oem01[0].vm_size
  zones                 = [var.oem01[0].zones]

  delete_os_disk_on_termination = var.oem01[0].delete_os_disk_on_termination

  delete_data_disks_on_termination = var.oem01[0].delete_data_disks_on_termination

  storage_image_reference {
    id = var.oem01[0].image_id
  }

  storage_os_disk {
    name              = var.oem01[0].os_disk_name
    caching           = var.oem01[0].caching
    create_option     = var.oem01[0].create_option
    managed_disk_type = var.oem01[0].managed_disk_type
  }

  os_profile {
    computer_name  = var.oem01[0].computer_name
    admin_username = var.oem01[0].admin_username
  }

  os_profile_linux_config {
    disable_password_authentication = var.oem01[0].disable_password_authentication
    ssh_keys {
      path     = var.oem01[0].path
      key_data = file(var.oem01[0].key_data)
    }
  }
}

resource "azurerm_virtual_machine" "oem02" {
  name                  = var.oem02[0].name
  location              = azurerm_resource_group.rg01.location
  resource_group_name   = azurerm_resource_group.rg01.name
  network_interface_ids = [azurerm_network_interface.oem02-nic.id]
  vm_size               = var.oem02[0].vm_size
  zones                 = [var.oem02[0].zones]

  delete_os_disk_on_termination = var.oem02[0].delete_os_disk_on_termination

  delete_data_disks_on_termination = var.oem02[0].delete_data_disks_on_termination

  storage_image_reference {
    id = var.oem02[0].image_id
  }

  storage_os_disk {
    name              = var.oem02[0].os_disk_name
    caching           = var.oem02[0].caching
    create_option     = var.oem02[0].create_option
    managed_disk_type = var.oem02[0].managed_disk_type
  }

  os_profile {
    computer_name  = var.oem02[0].computer_name
    admin_username = var.oem02[0].admin_username
  }

  os_profile_linux_config {
    disable_password_authentication = var.oem02[0].disable_password_authentication
    ssh_keys {
      path     = var.oem02[0].path
      key_data = file(var.oem02[0].key_data)
    }
  }
}

resource "azurerm_managed_disk" "oemrepo01-swap" {
  name                 = var.oemrepo01-swap[0].name
  location             = azurerm_resource_group.rg01.location
  resource_group_name  = azurerm_resource_group.rg01.name
  storage_account_type = var.oemrepo01-swap[0].storage_account_type
  create_option        = var.oemrepo01-swap[0].create_option
  disk_size_gb         = var.oemrepo01-swap[0].disk_size_gb
  zone                 = var.oemrepo01-swap[0].zone
}

resource "azurerm_managed_disk" "oemrepo01-gridagent" {
  name                 = var.oemrepo01-gridagent[0].name
  location             = azurerm_resource_group.rg01.location
  resource_group_name  = azurerm_resource_group.rg01.name
  storage_account_type = var.oemrepo01-gridagent[0].storage_account_type
  create_option        = var.oemrepo01-gridagent[0].create_option
  disk_size_gb         = var.oemrepo01-gridagent[0].disk_size_gb
  zone                 = var.oemrepo01-gridagent[0].zone
}

resource "azurerm_managed_disk" "oemrepo01-u01" {
  name                 = var.oemrepo01-u01[0].name
  location             = azurerm_resource_group.rg01.location
  resource_group_name  = azurerm_resource_group.rg01.name
  storage_account_type = var.oemrepo01-u01[0].storage_account_type
  create_option        = var.oemrepo01-u01[0].create_option
  disk_size_gb         = var.oemrepo01-u01[0].disk_size_gb
  zone                 = var.oemrepo01-u01[0].zone
}

resource "azurerm_managed_disk" "oemrepo01-u02" {
  name                 = var.oemrepo01-u02[0].name
  location             = azurerm_resource_group.rg01.location
  resource_group_name  = azurerm_resource_group.rg01.name
  storage_account_type = var.oemrepo01-u02[0].storage_account_type
  create_option        = var.oemrepo01-u02[0].create_option
  disk_size_gb         = var.oemrepo01-u02[0].disk_size_gb
  zone                 = var.oemrepo01-u02[0].zone
}

resource "azurerm_managed_disk" "oem01-swap" {
  name                 = var.oem01-swap[0].name
  location             = azurerm_resource_group.rg01.location
  resource_group_name  = azurerm_resource_group.rg01.name
  storage_account_type = var.oem01-swap[0].storage_account_type
  create_option        = var.oem01-swap[0].create_option
  disk_size_gb         = var.oem01-swap[0].disk_size_gb
  zone                 = var.oem01-swap[0].zone
}

resource "azurerm_managed_disk" "oem01-gridagent" {
  name                 = var.oem01-gridagent[0].name
  location             = azurerm_resource_group.rg01.location
  resource_group_name  = azurerm_resource_group.rg01.name
  storage_account_type = var.oem01-gridagent[0].storage_account_type
  create_option        = var.oem01-gridagent[0].create_option
  disk_size_gb         = var.oem01-gridagent[0].disk_size_gb
  zone                 = var.oem01-gridagent[0].zone
}

resource "azurerm_managed_disk" "oem01-u01" {
  name                 = var.oem01-u01[0].name
  location             = azurerm_resource_group.rg01.location
  resource_group_name  = azurerm_resource_group.rg01.name
  storage_account_type = var.oem01-u01[0].storage_account_type
  create_option        = var.oem01-u01[0].create_option
  disk_size_gb         = var.oem01-u01[0].disk_size_gb
  zone                 = var.oem01-u01[0].zone
}

resource "azurerm_managed_disk" "oem02-swap" {
  name                 = var.oem02-swap[0].name
  location             = azurerm_resource_group.rg01.location
  resource_group_name  = azurerm_resource_group.rg01.name
  storage_account_type = var.oem02-swap[0].storage_account_type
  create_option        = var.oem02-swap[0].create_option
  disk_size_gb         = var.oem02-swap[0].disk_size_gb
  zone                 = var.oem02-swap[0].zone
}

resource "azurerm_managed_disk" "oem02-gridagent" {
  name                 = var.oem02-gridagent[0].name
  location             = azurerm_resource_group.rg01.location
  resource_group_name  = azurerm_resource_group.rg01.name
  storage_account_type = var.oem02-gridagent[0].storage_account_type
  create_option        = var.oem02-gridagent[0].create_option
  disk_size_gb         = var.oem02-gridagent[0].disk_size_gb
  zone                 = var.oem02-gridagent[0].zone
}

resource "azurerm_managed_disk" "oem02-u01" {
  name                 = var.oem02-u01[0].name
  location             = azurerm_resource_group.rg01.location
  resource_group_name  = azurerm_resource_group.rg01.name
  storage_account_type = var.oem02-u01[0].storage_account_type
  create_option        = var.oem02-u01[0].create_option
  disk_size_gb         = var.oem02-u01[0].disk_size_gb
  zone                 = var.oem02-u01[0].zone
}

resource "azurerm_virtual_machine_data_disk_attachment" "oemrepo01-attach-swap" {
  managed_disk_id    = azurerm_managed_disk.oemrepo01-swap.id
  virtual_machine_id = azurerm_virtual_machine.oemrepo01.id
  lun                = var.oemrepo01-attach-swap[0].lun
  caching            = var.oemrepo01-attach-swap[0].caching
}

resource "azurerm_virtual_machine_data_disk_attachment" "oemrepo01-attach-gridagent" {
  managed_disk_id    = azurerm_managed_disk.oemrepo01-gridagent.id
  virtual_machine_id = azurerm_virtual_machine.oemrepo01.id
  lun                = var.oemrepo01-attach-gridagent[0].lun
  caching            = var.oemrepo01-attach-gridagent[0].caching
}

resource "azurerm_virtual_machine_data_disk_attachment" "oemrepo01-attach-u01" {
  managed_disk_id    = azurerm_managed_disk.oemrepo01-u01.id
  virtual_machine_id = azurerm_virtual_machine.oemrepo01.id
  lun                = var.oemrepo01-attach-u01[0].lun
  caching            = var.oemrepo01-attach-u01[0].caching
}

resource "azurerm_virtual_machine_data_disk_attachment" "oemrepo01-attach-u02" {
  managed_disk_id    = azurerm_managed_disk.oemrepo01-u02.id
  virtual_machine_id = azurerm_virtual_machine.oemrepo01.id
  lun                = var.oemrepo01-attach-u02[0].lun
  caching            = var.oemrepo01-attach-u02[0].caching
}

resource "azurerm_virtual_machine_data_disk_attachment" "oem01-attach-swap" {
  managed_disk_id    = azurerm_managed_disk.oem01-swap.id
  virtual_machine_id = azurerm_virtual_machine.oem01.id
  lun                = var.oem01-attach-swap[0].lun
  caching            = var.oem01-attach-swap[0].caching
}

resource "azurerm_virtual_machine_data_disk_attachment" "oem01-attach-gridagent" {
  managed_disk_id    = azurerm_managed_disk.oem01-gridagent.id
  virtual_machine_id = azurerm_virtual_machine.oem01.id
  lun                = var.oem01-attach-gridagent[0].lun
  caching            = var.oem01-attach-gridagent[0].caching
}

resource "azurerm_virtual_machine_data_disk_attachment" "oem01-attach-u01" {
  managed_disk_id    = azurerm_managed_disk.oem01-u01.id
  virtual_machine_id = azurerm_virtual_machine.oem01.id
  lun                = var.oem01-attach-u01[0].lun
  caching            = var.oem01-attach-u01[0].caching
}

resource "azurerm_virtual_machine_data_disk_attachment" "oem02-attach-swap" {
  managed_disk_id    = azurerm_managed_disk.oem02-swap.id
  virtual_machine_id = azurerm_virtual_machine.oem02.id
  lun                = var.oem02-attach-swap[0].lun
  caching            = var.oem02-attach-swap[0].caching
}

resource "azurerm_virtual_machine_data_disk_attachment" "oem02-attach-gridagent" {
  managed_disk_id    = azurerm_managed_disk.oem02-gridagent.id
  virtual_machine_id = azurerm_virtual_machine.oem02.id
  lun                = var.oem02-attach-gridagent[0].lun
  caching            = var.oem02-attach-gridagent[0].caching
}

resource "azurerm_virtual_machine_data_disk_attachment" "oem02-attach-u01" {
  managed_disk_id    = azurerm_managed_disk.oem02-u01.id
  virtual_machine_id = azurerm_virtual_machine.oem02.id
  lun                = var.oem02-attach-u01[0].lun
  caching            = var.oem02-attach-u01[0].caching
}
