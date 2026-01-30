variable "rg01" {
  type    = string
  default = "OEM01"
}

variable "nsg01" {
  type    = string
  default = "nsg01"
}

variable "vnet01" {
  type = list(object({
    name          = string
    address_space = string
    ddos_enable   = bool
  }))

  default = [
    {
      name          = "vnet01"
      address_space = "10.0.0.0/16"
      ddos_enable   = true
    }
  ]
}

variable "bastion-subnet01" {
  type = list(object({
    name             = string
    address_prefixes = string
  }))

  default = [
    {
      name             = "AzureBastionSubnet"
      address_prefixes = "10.0.2.0/24"
    }
  ]
}

variable "bastion-host01-ip" {
  type = list(object({
    name              = string
    sku               = string
    allocation_method = string
  }))

  default = [
    {
      name              = "bastion-host01-ip"
      sku               = "Standard"
      allocation_method = "Static"
    }
  ]
}

variable "bastion-host01" {
  type = list(object({
    name          = string
    ipconfig_name = string
  }))

  default = [
    {
      name          = "bastion-host01"
      ipconfig_name = "bastion-host01-ipconf"
    }
  ]
}

variable "nat-gw01" {
  type = list(object({
    name                    = string
    sku_name                = string
    idle_timeout_in_minutes = number
  }))

  default = [
    {
      name                    = "nat-gw01"
      sku_name                = "Standard"
      idle_timeout_in_minutes = 10
    }
  ]
}

variable "nat-gw01-ip" {
  type = list(object({
    name              = string
    sku               = string
    allocation_method = string
  }))

  default = [
    {
      name              = "nat-gw01-ip"
      sku               = "Standard"
      allocation_method = "Static"
    }
  ]
}

variable "vm-subnet01" {
  type = list(object({
    name             = string
    address_prefixes = string
  }))

  default = [
    {
      name             = "vm-subnet01"
      address_prefixes = "10.0.1.0/24"
    }
  ]
}

variable "oemrepo01-nic" {
  type = list(object({
    name                          = string
    ipconfig_name                 = string
    private_ip_address_allocation = string
    private_ip_address_version    = string
    private_ip_address            = string
  }))

  default = [
    {
      name                          = "oemrepo01-nic"
      ipconfig_name                 = "internal"
      private_ip_address_allocation = "Static"
      private_ip_address_version    = "IPv4"
      private_ip_address            = "10.0.1.4"
    }
  ]
}

variable "oem01-nic" {
  type = list(object({
    name                          = string
    ipconfig_name                 = string
    private_ip_address_allocation = string
    private_ip_address_version    = string
    private_ip_address            = string
  }))

  default = [
    {
      name                          = "oem01-nic"
      ipconfig_name                 = "internal"
      private_ip_address_allocation = "Static"
      private_ip_address_version    = "IPv4"
      private_ip_address            = "10.0.1.5"

    }
  ]
}

variable "oem02-nic" {
  type = list(object({
    name                          = string
    ipconfig_name                 = string
    private_ip_address_allocation = string
    private_ip_address_version    = string
    private_ip_address            = string
  }))

  default = [
    {
      name                          = "oem02-nic"
      ipconfig_name                 = "internal"
      private_ip_address_allocation = "Static"
      private_ip_address_version    = "IPv4"
      private_ip_address            = "10.0.1.6"
    }
  ]
}

variable "oemrepo01" {
  type = list(object({
    name                             = string
    vm_size                          = string
    zones                            = number
    delete_os_disk_on_termination    = bool
    delete_data_disks_on_termination = bool
    image_id                         = string
    os_disk_name                     = string
    caching                          = string
    create_option                    = string
    managed_disk_type                = string
    computer_name                    = string
    admin_username                   = string
    disable_password_authentication  = bool
    path                             = string
    key_data                         = string
  }))

  default = [
    {
      name                             = "oemrepo01"
      vm_size                          = "Standard_B4ms"
      zones                            = 1
      delete_os_disk_on_termination    = true
      delete_data_disks_on_termination = true
      image_id                         = "/subscriptions/0ce4d167-b6f8-429d-8c0d-7637d25fd659/resourceGroups/prod_golden_image_azu_gallery/providers/Microsoft.Compute/galleries/prod_golden_image_azu_gallery/images/RHEL_9"
      os_disk_name                     = "oemrepo01-os"
      caching                          = "ReadWrite"
      create_option                    = "FromImage"
      managed_disk_type                = "Standard_LRS"
      computer_name                    = "oemrepo01"
      admin_username                   = "azureuser"
      disable_password_authentication  = true
      path                             = "/home/azureuser/.ssh/authorized_keys"
      key_data                         = "./rsa-pub-key/id_rsa.pub"
    }
  ]
}

variable "oem01" {
  type = list(object({
    name                             = string
    vm_size                          = string
    zones                            = number
    delete_os_disk_on_termination    = bool
    delete_data_disks_on_termination = bool
    image_id                         = string
    os_disk_name                     = string
    caching                          = string
    create_option                    = string
    managed_disk_type                = string
    computer_name                    = string
    admin_username                   = string
    disable_password_authentication  = bool
    path                             = string
    key_data                         = string
  }))

  default = [
    {
      name                             = "oem01"
      vm_size                          = "Standard_B4ms"
      zones                            = 1
      delete_os_disk_on_termination    = true
      delete_data_disks_on_termination = true
      image_id                         = "/subscriptions/0ce4d167-b6f8-429d-8c0d-7637d25fd659/resourceGroups/prod_golden_image_azu_gallery/providers/Microsoft.Compute/galleries/prod_golden_image_azu_gallery/images/RHEL_9"
      os_disk_name                     = "oem01-os"
      caching                          = "ReadWrite"
      create_option                    = "FromImage"
      managed_disk_type                = "Standard_LRS"
      computer_name                    = "oem01"
      admin_username                   = "azureuser"
      disable_password_authentication  = true
      path                             = "/home/azureuser/.ssh/authorized_keys"
      key_data                         = "./rsa-pub-key/id_rsa.pub"
    }
  ]
}

variable "oem02" {
  type = list(object({
    name                             = string
    vm_size                          = string
    zones                            = number
    delete_os_disk_on_termination    = bool
    delete_data_disks_on_termination = bool
    image_id                         = string
    os_disk_name                     = string
    caching                          = string
    create_option                    = string
    managed_disk_type                = string
    computer_name                    = string
    admin_username                   = string
    disable_password_authentication  = bool
    path                             = string
    key_data                         = string
  }))

  default = [
    {
      name                             = "oem02"
      vm_size                          = "Standard_B4ms"
      zones                            = 2
      delete_os_disk_on_termination    = true
      delete_data_disks_on_termination = true
      image_id                         = "/subscriptions/0ce4d167-b6f8-429d-8c0d-7637d25fd659/resourceGroups/prod_golden_image_azu_gallery/providers/Microsoft.Compute/galleries/prod_golden_image_azu_gallery/images/RHEL_9"
      os_disk_name                     = "oem02-os"
      caching                          = "ReadWrite"
      create_option                    = "FromImage"
      managed_disk_type                = "Standard_LRS"
      computer_name                    = "oem02"
      admin_username                   = "azureuser"
      disable_password_authentication  = true
      path                             = "/home/azureuser/.ssh/authorized_keys"
      key_data                         = "./rsa-pub-key/id_rsa.pub"
    }
  ]
}

variable "oemrepo01-swap" {
  type = list(object({
    name                 = string
    storage_account_type = string
    create_option        = string
    disk_size_gb         = string
    zone                 = number
  }))

  default = [
    {
      name                 = "oemrepo01-swap"
      storage_account_type = "Standard_LRS"
      create_option        = "Empty"
      disk_size_gb         = "20"
      zone                 = 1
    }
  ]
}

variable "oemrepo01-gridagent" {
  type = list(object({
    name                 = string
    storage_account_type = string
    create_option        = string
    disk_size_gb         = string
    zone                 = number
  }))

  default = [
    {
      name                 = "oemrepo01-gridagent"
      storage_account_type = "Standard_LRS"
      create_option        = "Empty"
      disk_size_gb         = "20"
      zone                 = 1
    }
  ]
}

variable "oemrepo01-u01" {
  type = list(object({
    name                 = string
    storage_account_type = string
    create_option        = string
    disk_size_gb         = string
    zone                 = number
  }))

  default = [
    {
      name                 = "oemrepo01-u01"
      storage_account_type = "Standard_LRS"
      create_option        = "Empty"
      disk_size_gb         = "50"
      zone                 = 1
    }
  ]
}

variable "oemrepo01-u02" {
  type = list(object({
    name                 = string
    storage_account_type = string
    create_option        = string
    disk_size_gb         = string
    zone                 = number
  }))

  default = [
    {
      name                 = "oemrepo01-u02"
      storage_account_type = "Standard_LRS"
      create_option        = "Empty"
      disk_size_gb         = "50"
      zone                 = 1
    }
  ]
}

variable "oem01-swap" {
  type = list(object({
    name                 = string
    storage_account_type = string
    create_option        = string
    disk_size_gb         = string
    zone                 = number
  }))

  default = [
    {
      name                 = "oem01-swap"
      storage_account_type = "Standard_LRS"
      create_option        = "Empty"
      disk_size_gb         = "20"
      zone                 = 1
    }
  ]
}

variable "oem01-gridagent" {
  type = list(object({
    name                 = string
    storage_account_type = string
    create_option        = string
    disk_size_gb         = string
    zone                 = number
  }))

  default = [
    {
      name                 = "oem01-gridagent"
      storage_account_type = "Standard_LRS"
      create_option        = "Empty"
      disk_size_gb         = "20"
      zone                 = 1
    }
  ]
}

variable "oem01-u01" {
  type = list(object({
    name                 = string
    storage_account_type = string
    create_option        = string
    disk_size_gb         = string
    zone                 = number
  }))

  default = [
    {
      name                 = "oem01-u01"
      storage_account_type = "Standard_LRS"
      create_option        = "Empty"
      disk_size_gb         = "50"
      zone                 = 1
    }
  ]
}

variable "oem02-swap" {
  type = list(object({
    name                 = string
    storage_account_type = string
    create_option        = string
    disk_size_gb         = string
    zone                 = number
  }))

  default = [
    {
      name                 = "oem02-swap"
      storage_account_type = "Standard_LRS"
      create_option        = "Empty"
      disk_size_gb         = "20"
      zone                 = 2
    }
  ]
}

variable "oem02-gridagent" {
  type = list(object({
    name                 = string
    storage_account_type = string
    create_option        = string
    disk_size_gb         = string
    zone                 = number
  }))

  default = [
    {
      name                 = "oem02-gridagent"
      storage_account_type = "Standard_LRS"
      create_option        = "Empty"
      disk_size_gb         = "20"
      zone                 = 2
    }
  ]
}

variable "oem02-u01" {
  type = list(object({
    name                 = string
    storage_account_type = string
    create_option        = string
    disk_size_gb         = string
    zone                 = number
  }))

  default = [
    {
      name                 = "oem02-u01"
      storage_account_type = "Standard_LRS"
      create_option        = "Empty"
      disk_size_gb         = "50"
      zone                 = 2
    }
  ]
}

variable "oemrepo01-attach-swap" {
  type = list(object({
    lun     = string
    caching = string
  }))

  default = [
    {
      lun     = "1"
      caching = "ReadWrite"
    }
  ]
}

variable "oemrepo01-attach-gridagent" {
  type = list(object({
    lun     = string
    caching = string
  }))

  default = [
    {
      lun     = "2"
      caching = "ReadWrite"
    }
  ]
}

variable "oemrepo01-attach-u01" {
  type = list(object({
    lun     = string
    caching = string
  }))

  default = [
    {
      lun     = "3"
      caching = "ReadWrite"
    }
  ]
}

variable "oemrepo01-attach-u02" {
  type = list(object({
    lun     = string
    caching = string
  }))

  default = [
    {
      lun     = "4"
      caching = "ReadWrite"
    }
  ]
}

variable "oem01-attach-swap" {
  type = list(object({
    lun     = string
    caching = string
  }))

  default = [
    {
      lun     = "1"
      caching = "ReadWrite"
    }
  ]
}

variable "oem01-attach-gridagent" {
  type = list(object({
    lun     = string
    caching = string
  }))

  default = [
    {
      lun     = "2"
      caching = "ReadWrite"
    }
  ]
}

variable "oem01-attach-u01" {
  type = list(object({
    lun     = string
    caching = string
  }))

  default = [
    {
      lun     = "3"
      caching = "ReadWrite"
    }
  ]
}

variable "oem02-attach-swap" {
  type = list(object({
    lun     = string
    caching = string
  }))

  default = [
    {
      lun     = "1"
      caching = "ReadWrite"
    }
  ]
}

variable "oem02-attach-gridagent" {
  type = list(object({
    lun     = string
    caching = string
  }))

  default = [
    {
      lun     = "2"
      caching = "ReadWrite"
    }
  ]
}

variable "oem02-attach-u01" {
  type = list(object({
    lun     = string
    caching = string
  }))

  default = [
    {
      lun     = "3"
      caching = "ReadWrite"
    }
  ]
}

variable "oem-lb01" {
  type = list(object({
    name                          = string
    sku                           = string
    sku_tier                      = string
    frontend_ip_conf_name         = string
    private_ip_address_allocation = string
    private_ip_address            = string
  }))

  default = [
    {
      name                          = "oem-lb01"
      sku                           = "Standard"
      sku_tier                      = "Regional"
      frontend_ip_conf_name         = "oem-lb01-frontend"
      private_ip_address_allocation = "Static"
      private_ip_address            = "10.0.1.10"
    }
  ]
}

variable "oem-lb01-backend" {
  type    = string
  default = "oem-lb01-backend"
}

variable "oem-lb01-upload-probe" {
  type = list(object({
    name                = string
    protocol            = string
    port                = number
    request_path        = string
    interval_in_seconds = number
    number_of_probes    = number
  }))

  default = [
    {
      name                = "oem-lb01-upload-probe"
      protocol            = "Https"
      port                = 4903
      request_path        = "/empbs/upload"
      interval_in_seconds = 60
      number_of_probes    = 2
    }
  ]
}

variable "oem-lb01-console-probe" {
  type = list(object({
    name                = string
    protocol            = string
    port                = number
    request_path        = string
    interval_in_seconds = number
    number_of_probes    = number
  }))

  default = [
    {
      name                = "oem-lb01-console-probe"
      protocol            = "Https"
      port                = 7803
      request_path        = "/em/consoleStatus.jsp"
      interval_in_seconds = 5
      number_of_probes    = 2
    }
  ]
}

variable "oem-lb01-AgentRegistration-probe" {
  type = list(object({
    name                = string
    protocol            = string
    port                = number
    request_path        = string
    interval_in_seconds = number
    number_of_probes    = number
  }))

  default = [
    {
      name                = "oem-lb01-AgentRegistration-probe"
      protocol            = "Http"
      port                = 4889
      request_path        = "/empbs/genwallet"
      interval_in_seconds = 60
      number_of_probes    = 2
    }
  ]
}

variable "oem-lb01-jvmd-probe" {
  type = list(object({
    name                = string
    protocol            = string
    port                = number
    request_path        = string
    interval_in_seconds = number
    number_of_probes    = number
  }))

  default = [
    {
      name                = "oem-lb01-jvmd-probe"
      protocol            = "Https"
      port                = 7301
      request_path        = "/jamservlet/comm"
      interval_in_seconds = 60
      number_of_probes    = 2
    }
  ]
}

variable "oem-lb01-upload-rule" {
  type = list(object({
    name                    = string
    protocol                = string
    frontend_port           = number
    backend_port            = number
    idle_timeout_in_minutes = number
    enable_floating_ip      = bool
    load_distribution       = string
  }))

  default = [
    {
      name                    = "oem-lb01-upload-rule"
      protocol                = "Tcp"
      frontend_port           = 4903
      backend_port            = 4903
      idle_timeout_in_minutes = 4
      enable_floating_ip      = false
      load_distribution       = "Default"
    }
  ]
}

variable "oem-lb01-console-rule" {
  type = list(object({
    name                    = string
    protocol                = string
    frontend_port           = number
    backend_port            = number
    idle_timeout_in_minutes = number
    enable_floating_ip      = bool
    load_distribution       = string
  }))

  default = [
    {
      name                    = "oem-lb01-console-rule"
      protocol                = "Tcp"
      frontend_port           = 443
      backend_port            = 7803
      idle_timeout_in_minutes = 4
      enable_floating_ip      = false
      load_distribution       = "SourceIP"
    }
  ]
}

variable "oem-lb01-AgentRegistration-rule" {
  type = list(object({
    name                    = string
    protocol                = string
    frontend_port           = number
    backend_port            = number
    idle_timeout_in_minutes = number
    enable_floating_ip      = bool
    load_distribution       = string
  }))

  default = [
    {
      name                    = "oem-lb01-AgentRegistration-rule"
      protocol                = "Tcp"
      frontend_port           = 4889
      backend_port            = 4889
      idle_timeout_in_minutes = 4
      enable_floating_ip      = false
      load_distribution       = "Default"
    }
  ]
}

variable "oem-lb01-jvmd-rule" {
  type = list(object({
    name                    = string
    protocol                = string
    frontend_port           = number
    backend_port            = number
    idle_timeout_in_minutes = number
    enable_floating_ip      = bool
    load_distribution       = string
  }))

  default = [
    {
      name                    = "oem-lb01-jvmd-rule"
      protocol                = "Tcp"
      frontend_port           = 7301
      backend_port            = 7301
      idle_timeout_in_minutes = 4
      enable_floating_ip      = false
      load_distribution       = "SourceIP"
    }
  ]
}

variable "stgacctoem01" {
  type = list(object({
    name                            = string
    account_tier                    = string
    account_replication_type        = string
    account_kind                    = string
    is_hns_enabled                  = bool
    nfsv3_enabled                   = bool
    public_network_access_enabled   = bool
    https_traffic_only_enabled      = bool
    allow_nested_items_to_be_public = bool
  }))

  default = [
    {
      name                            = "stgacctoem01"
      account_tier                    = "Premium"
      account_replication_type        = "ZRS"
      account_kind                    = "FileStorage"
      is_hns_enabled                  = false
      nfsv3_enabled                   = false
      public_network_access_enabled   = false
      https_traffic_only_enabled      = false
      allow_nested_items_to_be_public = false
    }
  ]
}

variable "nfs01" {
  type = list(object({
    name             = string
    quota            = number
    enabled_protocol = string
  }))

  default = [
    {
      name             = "nfs01"
      quota            = 100
      enabled_protocol = "NFS"
    }
  ]
}

variable "private-endpoint01" {
  type = list(object({
    name                            = string
    private_service_connection_name = string
    subresource_names               = string
    is_manual_connection            = bool
    private_dns_zone_group_name     = string
    ip_configuration_name           = string
    private_ip_address              = string
    subresource_name                = string
  }))

  default = [
    {
      name                            = "private-endpoint01"
      private_service_connection_name = "private-service-connection01"
      subresource_names               = "file"
      is_manual_connection            = false
      private_dns_zone_group_name     = "private-dns-zone-group01"
      ip_configuration_name           = "ip_configuration01"
      private_ip_address              = "10.0.1.11"
      subresource_name                = "file"
    }
  ]
}

variable "private-dns-zone01" {
  type    = string
  default = "privatelink.file.core.windows.net"
}

variable "private-dns-zone-virtual-network-link01" {
  type    = string
  default = "private-dns-zone-virtual-network-link01"
}

variable "private-dns-record01-ttl" {
  type    = number
  default = 300
}

variable "backup-vault01" {
  type = list(object({
    name = string
    sku  = string
  }))

  default = [
    {
      name = "nfs01"
      sku  = "Standard"
    }
  ]
}

variable "backup-policy01" {
  type = list(object({
    name      = string
    timezone  = string
    frequency = string
    time      = string
    count     = number
  }))

  default = [
    {
      name      = "backup-policy01"
      timezone  = "India Standard Time"
      frequency = "Daily"
      time      = "01:00"
      count     = 10
    }
  ]
}

variable "oem01-source-id" {
  type    = string
  default = "/subscriptions/__SUBSCRIPTION__/resourceGroups/OEM01/providers/Microsoft.Compute/virtualMachines/oem01"
}

variable "oem02-source-id" {
  type    = string
  default = "/subscriptions/__SUBSCRIPTION__/resourceGroups/OEM01/providers/Microsoft.Compute/virtualMachines/oem02"
}

variable "oemrepo01-source-id" {
  type    = string
  default = "/subscriptions/__SUBSCRIPTION__/resourceGroups/OEM01/providers/Microsoft.Compute/virtualMachines/oemrepo01"
}
