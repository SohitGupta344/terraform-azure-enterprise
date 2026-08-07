variable "application_gateways" {
  description = "A map of application gateways to create."
  type = map(object({
    name                 = string
    location             = string
    resource_group_name  = string
    subnet_id            = string
    public_ip_address_id = string
    backend_ip_addresses = list(string)
    tags                 = optional(map(string), {})
  }))
}
