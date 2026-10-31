resource "null_resource" "hostname" {
  for_each   = var.linux_vms
  depends_on = [azurerm_linux_virtual_machine.vm]

  connection {
    type        = "ssh"
    user        = var.admin_username
    private_key = file(pathexpand(var.private_key_path))
    host        = azurerm_public_ip.pip[each.key].ip_address
  }

  provisioner "remote-exec" {
    inline = ["hostname"]
  }
}