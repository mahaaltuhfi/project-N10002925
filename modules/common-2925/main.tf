resource "azurerm_log_analytics_workspace" "law" {
  name                = var.law_name
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = var.law_sku
  retention_in_days   = var.law_retention_days
  tags                = var.tags
}

resource "azurerm_recovery_services_vault" "rsv" {
  name                = var.rsv_name
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = var.rsv_sku

  tags = var.tags
}

resource "azurerm_storage_account" "sa" {
  name                     = var.sa_name
  location                 = var.location
  resource_group_name      = var.rg_name
  account_tier             = var.sa_tier
  account_replication_type = var.sa_replication
  tags                     = var.tags
}