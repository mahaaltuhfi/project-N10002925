output "resource_group_name" {
  value = module.rgroup.rg_name
}

output "vnet_name" {
  value = module.network.vnet_name
}

output "subnet_name" {
  value = module.network.subnet_name
}

output "log_analytics_workspace_name" {
  value = module.common.law_name
}

output "recovery_services_vault_name" {
  value = module.common.rsv_name
}

output "storage_account_name" {
  value = module.common.sa_name
}