resource "azurerm_linux_virtual_machine" "vm" {
  for_each = var.virtual_machines

  name                            = each.value.name
  location                        = each.value.location
  resource_group_name             = each.value.resource_group_name
  network_interface_ids           = each.value.network_interface_ids
  size                            = each.value.size
  admin_username                  = each.value.admin_username
  admin_password                  = each.value.admin_password
  disable_password_authentication = each.value.disable_password_authentication
  custom_data                     = each.value.custom_data
  tags                            = each.value.tags

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
