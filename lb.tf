resource "azurerm_lb" "oem-lb01" {
  name                = var.oem-lb01[0].name
  location            = azurerm_resource_group.rg01.location
  resource_group_name = azurerm_resource_group.rg01.name
  sku                 = var.oem-lb01[0].sku
  sku_tier            = var.oem-lb01[0].sku_tier

  frontend_ip_configuration {
    name                          = var.oem-lb01[0].frontend_ip_conf_name
    subnet_id                     = azurerm_subnet.vm-subnet01.id
    private_ip_address_allocation = var.oem-lb01[0].private_ip_address_allocation
    private_ip_address            = var.oem-lb01[0].private_ip_address
  }
}

resource "azurerm_lb_backend_address_pool" "oem-lb01-backend" {
  name            = var.oem-lb01-backend
  loadbalancer_id = azurerm_lb.oem-lb01.id
}

resource "azurerm_network_interface_backend_address_pool_association" "oem-lb01-backend-association01" {
  network_interface_id    = azurerm_network_interface.oem01-nic.id
  ip_configuration_name   = azurerm_network_interface.oem01-nic.ip_configuration[0].name
  backend_address_pool_id = azurerm_lb_backend_address_pool.oem-lb01-backend.id
}

resource "azurerm_network_interface_backend_address_pool_association" "oem-lb01-backend-association02" {
  network_interface_id    = azurerm_network_interface.oem02-nic.id
  ip_configuration_name   = azurerm_network_interface.oem02-nic.ip_configuration[0].name
  backend_address_pool_id = azurerm_lb_backend_address_pool.oem-lb01-backend.id
}

resource "azurerm_lb_probe" "oem-lb01-upload-probe" {
  name                = var.oem-lb01-upload-probe[0].name
  loadbalancer_id     = azurerm_lb.oem-lb01.id
  protocol            = var.oem-lb01-upload-probe[0].protocol
  port                = var.oem-lb01-upload-probe[0].port
  request_path        = var.oem-lb01-upload-probe[0].request_path
  interval_in_seconds = var.oem-lb01-upload-probe[0].interval_in_seconds
  number_of_probes    = var.oem-lb01-upload-probe[0].number_of_probes
}

resource "azurerm_lb_probe" "oem-lb01-console-probe" {
  name                = var.oem-lb01-console-probe[0].name
  loadbalancer_id     = azurerm_lb.oem-lb01.id
  protocol            = var.oem-lb01-console-probe[0].protocol
  port                = var.oem-lb01-console-probe[0].port
  request_path        = var.oem-lb01-console-probe[0].request_path
  interval_in_seconds = var.oem-lb01-console-probe[0].interval_in_seconds
  number_of_probes    = var.oem-lb01-console-probe[0].number_of_probes
}

resource "azurerm_lb_probe" "oem-lb01-AgentRegistration-probe" {
  name                = var.oem-lb01-AgentRegistration-probe[0].name
  loadbalancer_id     = azurerm_lb.oem-lb01.id
  protocol            = var.oem-lb01-AgentRegistration-probe[0].protocol
  port                = var.oem-lb01-AgentRegistration-probe[0].port
  request_path        = var.oem-lb01-AgentRegistration-probe[0].request_path
  interval_in_seconds = var.oem-lb01-AgentRegistration-probe[0].interval_in_seconds
  number_of_probes    = var.oem-lb01-AgentRegistration-probe[0].number_of_probes
}

resource "azurerm_lb_probe" "oem-lb01-jvmd-probe" {
  name                = var.oem-lb01-jvmd-probe[0].name
  loadbalancer_id     = azurerm_lb.oem-lb01.id
  protocol            = var.oem-lb01-jvmd-probe[0].protocol
  port                = var.oem-lb01-jvmd-probe[0].port
  request_path        = var.oem-lb01-jvmd-probe[0].request_path
  interval_in_seconds = var.oem-lb01-jvmd-probe[0].interval_in_seconds
  number_of_probes    = var.oem-lb01-jvmd-probe[0].number_of_probes
}

resource "azurerm_lb_rule" "oem-lb01-upload-rule" {
  name                           = var.oem-lb01-upload-rule[0].name
  loadbalancer_id                = azurerm_lb.oem-lb01.id
  frontend_ip_configuration_name = azurerm_lb.oem-lb01.frontend_ip_configuration[0].name
  probe_id                       = azurerm_lb_probe.oem-lb01-upload-probe.id
  protocol                       = var.oem-lb01-upload-rule[0].protocol
  frontend_port                  = var.oem-lb01-upload-rule[0].frontend_port
  backend_port                   = var.oem-lb01-upload-rule[0].backend_port
  idle_timeout_in_minutes        = var.oem-lb01-upload-rule[0].idle_timeout_in_minutes
  enable_floating_ip             = var.oem-lb01-upload-rule[0].enable_floating_ip
  load_distribution              = var.oem-lb01-upload-rule[0].load_distribution
}

resource "azurerm_lb_rule" "oem-lb01-console-rule" {
  name                           = var.oem-lb01-console-rule[0].name
  loadbalancer_id                = azurerm_lb.oem-lb01.id
  frontend_ip_configuration_name = azurerm_lb.oem-lb01.frontend_ip_configuration[0].name
  probe_id                       = azurerm_lb_probe.oem-lb01-console-probe.id
  protocol                       = var.oem-lb01-console-rule[0].protocol
  frontend_port                  = var.oem-lb01-console-rule[0].frontend_port
  backend_port                   = var.oem-lb01-console-rule[0].backend_port
  idle_timeout_in_minutes        = var.oem-lb01-console-rule[0].idle_timeout_in_minutes
  enable_floating_ip             = var.oem-lb01-console-rule[0].enable_floating_ip
  load_distribution              = var.oem-lb01-console-rule[0].load_distribution
}

resource "azurerm_lb_rule" "oem-lb01-AgentRegistration-rule" {
  name                           = var.oem-lb01-AgentRegistration-rule[0].name
  loadbalancer_id                = azurerm_lb.oem-lb01.id
  frontend_ip_configuration_name = azurerm_lb.oem-lb01.frontend_ip_configuration[0].name
  probe_id                       = azurerm_lb_probe.oem-lb01-AgentRegistration-probe.id
  protocol                       = var.oem-lb01-AgentRegistration-rule[0].protocol
  frontend_port                  = var.oem-lb01-AgentRegistration-rule[0].frontend_port
  backend_port                   = var.oem-lb01-AgentRegistration-rule[0].backend_port
  idle_timeout_in_minutes        = var.oem-lb01-AgentRegistration-rule[0].idle_timeout_in_minutes
  enable_floating_ip             = var.oem-lb01-AgentRegistration-rule[0].enable_floating_ip
  load_distribution              = var.oem-lb01-AgentRegistration-rule[0].load_distribution
}

resource "azurerm_lb_rule" "oem-lb01-jvmd-rule" {
  name                           = var.oem-lb01-jvmd-rule[0].name
  loadbalancer_id                = azurerm_lb.oem-lb01.id
  frontend_ip_configuration_name = azurerm_lb.oem-lb01.frontend_ip_configuration[0].name
  probe_id                       = azurerm_lb_probe.oem-lb01-jvmd-probe.id
  protocol                       = var.oem-lb01-jvmd-rule[0].protocol
  frontend_port                  = var.oem-lb01-jvmd-rule[0].frontend_port
  backend_port                   = var.oem-lb01-jvmd-rule[0].backend_port
  idle_timeout_in_minutes        = var.oem-lb01-jvmd-rule[0].idle_timeout_in_minutes
  enable_floating_ip             = var.oem-lb01-jvmd-rule[0].enable_floating_ip
  load_distribution              = var.oem-lb01-jvmd-rule[0].load_distribution
}
