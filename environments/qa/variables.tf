variable "resource_groups" {
  type = map(object({
    name     = string
    location = string
    tags     = optional(map(string), {})
  }))
}

variable "virtual_networks" {
  type = map(object({
    name                = string
    address_space       = list(string)
    location            = string
    resource_group_name = string
    tags                = optional(map(string), {})
  }))
}

variable "subnets" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
}

variable "nsgs" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    security_rules = list(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
    associated_subnets = optional(list(string), [])
    tags               = optional(map(string), {})
  }))
}

variable "public_ips" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    allocation_method   = string
    sku                 = string
    tags                = optional(map(string), {})
  }))
}

variable "network_interfaces" {
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

variable "bastions" {
  type = map(object({
    name                 = string
    location             = string
    resource_group_name  = string
    public_ip_address_id = string
    subnet_id            = string
    tags                 = optional(map(string), {})
  }))
}

variable "virtual_machines" {
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

variable "application_gateways" {
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
