output "virtual_networks" {
  description = "A map containing the created virtual networks."
  value = {
    for k, vnet in azurerm_virtual_network.vnet : k => {
      id                  = vnet.id
      name                = vnet.name
      resource_group_name = vnet.resource_group_name
      location            = vnet.location
    }
  }
}
