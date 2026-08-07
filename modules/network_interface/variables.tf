variable "network_interfaces" {
  description = "A map of network interfaces to create."
  type = map(object({
    name                          = string
    location                      = string
    resource_group_name           = string
    subnet_id                     = string
    private_ip_address_allocation = string
    private_ip_address            = optional(string)
    public_ip_address_id          = optional(string)
    network_security_group_id     = optional(string)
    tags                          = optional(map(string), {})
  }))
}
