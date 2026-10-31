resource "azurerm_managed_disk" "disk" {
  for_each             = var.vm_ids
  name                 = "${each.key}-datadisk"
  location             = var.location
  resource_group_name  = var.rg_name
  storage_account_type = var.disk_storage_type
  create_option        = "Empty"
  disk_size_gb         = var.disk_size_gb
  tags                 = var.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "attach" {
  for_each           = var.vm_ids
  managed_disk_id    = azurerm_managed_disk.disk[each.key].id
  virtual_machine_id = each.value
  lun                = var.lun
  caching            = var.disk_caching
}