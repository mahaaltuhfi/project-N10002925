output "hostnames" {
  value = azurerm_windows_virtual_machine.vm[*].computer_name
}

output "fqdns" {
  value = azurerm_public_ip.pip[*].fqdn
}

output "private_ips" {
  value = azurerm_windows_virtual_machine.vm[*].private_ip_address
}

output "public_ips" {
  value = azurerm_windows_virtual_machine.vm[*].public_ip_address
}

output "vm_ids" {
  value = azurerm_windows_virtual_machine.vm[*].id
}