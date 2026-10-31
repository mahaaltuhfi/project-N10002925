resource "azurerm_public_ip" "pip" {
  count               = var.vm_count
  name                = "${var.vm_name_prefix}${count.index + 1}-pip"
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
  sku                 = "Standard"
  domain_name_label   = "n${var.vm_name_prefix}${count.index + 1}"
  tags                = var.tags
}

resource "azurerm_network_interface" "nic" {
  count               = var.vm_count
  name                = "${var.vm_name_prefix}${count.index + 1}-nic"
  location            = var.location
  resource_group_name = var.rg_name
  tags                = var.tags

  ip_configuration {
    name                          = "${var.vm_name_prefix}${count.index + 1}-ipconfig"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip[count.index].id
  }
}

resource "azurerm_windows_virtual_machine" "vm" {
  count                 = var.vm_count
  name                  = "${var.vm_name_prefix}${count.index + 1}"
  computer_name         = "${var.vm_name_prefix}${count.index + 1}"
  location              = var.location
  resource_group_name   = var.rg_name
  size                  = var.vm_size
  availability_set_id   = var.avset_id
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  network_interface_ids = [azurerm_network_interface.nic[count.index].id]
  tags                  = var.tags

  os_disk {
    name                 = "${var.vm_name_prefix}${count.index + 1}-osdisk"
    caching              = var.os_disk_caching
    storage_account_type = var.os_disk_storage_type
  }

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }

  boot_diagnostics {
    storage_account_uri = var.boot_diag_uri
  }
}

resource "azurerm_virtual_machine_extension" "antimalware" {
  count                      = var.vm_count
  name                       = "IaaSAntimalware"
  virtual_machine_id         = azurerm_windows_virtual_machine.vm[count.index].id
  publisher                  = "Microsoft.Azure.Security"
  type                       = "IaaSAntimalware"
  type_handler_version       = "1.3"
  auto_upgrade_minor_version = true
  tags                       = var.tags

  settings = jsonencode({
    AntimalwareEnabled = true
  })
}