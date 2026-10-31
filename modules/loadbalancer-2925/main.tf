# 1. Public IP for the load balancer
resource "azurerm_public_ip" "lb_pip" {
  name                = var.lb_pip_name
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = var.tags
}

# 2. The load balancer
resource "azurerm_lb" "lb" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = "Standard"
  tags                = var.tags

  frontend_ip_configuration {
    name                 = var.frontend_name
    public_ip_address_id = azurerm_public_ip.lb_pip.id
  }
}

# 3. Backend pool (list of VMs)
resource "azurerm_lb_backend_address_pool" "pool" {
  name            = var.backend_pool_name
  loadbalancer_id = azurerm_lb.lb.id
}

# 4. Health probe
resource "azurerm_lb_probe" "probe" {
  name            = var.probe_name
  loadbalancer_id = azurerm_lb.lb.id
  protocol        = "Tcp"
  port            = var.probe_port
}

# 5. Load balancing rule
resource "azurerm_lb_rule" "rule" {
  name                           = var.rule_name
  loadbalancer_id                = azurerm_lb.lb.id
  protocol                       = "Tcp"
  frontend_port                  = var.frontend_port
  backend_port                   = var.backend_port
  frontend_ip_configuration_name = var.frontend_name
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.pool.id]
  probe_id                       = azurerm_lb_probe.probe.id
}

# 6. Put each Linux VM's NIC into the pool
resource "azurerm_network_interface_backend_address_pool_association" "assoc" {
  for_each                = var.nic_ids
  network_interface_id    = each.value
  ip_configuration_name   = var.ipconfig_names[each.key]
  backend_address_pool_id = azurerm_lb_backend_address_pool.pool.id
}