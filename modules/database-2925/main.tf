resource "azurerm_postgresql_flexible_server" "db" {
  name                   = var.db_name
  resource_group_name    = var.rg_name
  location               = var.location
  version                = var.db_version
  administrator_login    = var.admin_username
  administrator_password = var.admin_password
  sku_name               = var.sku_name
  storage_mb             = var.storage_mb
  backup_retention_days  = var.backup_retention_days
  tags                   = var.tags

  lifecycle {
    ignore_changes = [zone]
  }
}