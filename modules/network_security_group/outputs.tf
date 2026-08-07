output "network_security_groups" {
  description = "A map containing the created network security groups."
  value = {
    for k, nsg in azurerm_network_security_group.nsg : k => {
      id   = nsg.id
      name = nsg.name
    }
  }
}
