variable "bastions" {
  description = "A map of Azure Bastion hosts to create."
  type = map(object({
    name                 = string
    location             = string
    resource_group_name  = string
    public_ip_address_id = string
    subnet_id            = string
    tags                 = optional(map(string), {})
  }))
}
