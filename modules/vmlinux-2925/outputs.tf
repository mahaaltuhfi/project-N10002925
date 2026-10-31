output "hostnames" {
  value = { for k, vm in azurerm_linux_virtual_machine.vm : k => vm.computer_name }
}

output "fqdns" {
  value = { for k, ip in azurerm_public_ip.pip : k => ip.fqdn }
}

output "private_ips" {
  value = { for k, vm in azurerm_linux_virtual_machine.vm : k => vm.private_ip_address }
}

output "public_ips" {
  value = { for k, vm in azurerm_linux_virtual_machine.vm : k => vm.public_ip_address }
}

output "vm_ids" {
  value = { for k, vm in azurerm_linux_virtual_machine.vm : k => vm.id }
}

output "nic_ids" {
  value = { for k, nic in azurerm_network_interface.nic : k => nic.id }
}

output "ipconfig_names" {
  value = { for k, nic in azurerm_network_interface.nic : k => nic.ip_configuration[0].name }
}