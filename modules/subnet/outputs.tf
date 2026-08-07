output "subnets" {
  description = "A map containing the created subnets."
  value = {
    for k, subnet in azurerm_subnet.subnet : k => {
      id                   = subnet.id
      name                 = subnet.name
      virtual_network_name = subnet.virtual_network_name
    }
  }
}
