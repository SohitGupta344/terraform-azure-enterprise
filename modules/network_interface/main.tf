resource "azurerm_network_interface" "nic" {
  for_each = var.network_interfaces

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  tags                = each.value.tags

  ip_configuration {
    name                          = "internal"
    subnet_id                     = each.value.subnet_id
    private_ip_address_allocation = each.value.private_ip_address_allocation
    private_ip_address            = each.value.private_ip_address
    public_ip_address_id          = each.value.public_ip_address_id
  }
}

resource "azurerm_network_interface_security_group_association" "nic_nsg" {
  for_each = {
    for k, v in var.network_interfaces : k => v
    if v.network_security_group_id != null
  }

  network_interface_id      = azurerm_network_interface.nic[each.key].id
  network_security_group_id = each.value.network_security_group_id
}
