output "network_interfaces" {
  description = "A map containing the created network interfaces."
  value = {
    for k, nic in azurerm_network_interface.nic : k => {
      id                 = nic.id
      name               = nic.name
      private_ip_address = nic.private_ip_address
    }
  }
}
