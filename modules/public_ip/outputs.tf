output "public_ips" {
  description = "A map containing the created public IPs."
  value = {
    for k, pip in azurerm_public_ip.pip : k => {
      id         = pip.id
      name       = pip.name
      ip_address = pip.ip_address
    }
  }
}
