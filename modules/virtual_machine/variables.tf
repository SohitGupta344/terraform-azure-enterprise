variable "virtual_machines" {
  description = "A map of virtual machines to create."
  type = map(object({
    name                            = string
    location                        = string
    resource_group_name             = string
    network_interface_ids           = list(string)
    size                            = string
    admin_username                  = string
    admin_password                  = string
    disable_password_authentication = bool
    custom_data                     = optional(string)
    tags                            = optional(map(string), {})
  }))
}
