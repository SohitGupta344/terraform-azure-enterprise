resource "azurerm_network_security_group" "nsg" {
  for_each = var.nsgs

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  tags                = each.value.tags

  dynamic "security_rule" {
    for_each = each.value.security_rules
    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.source_port_range
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = security_rule.value.source_address_prefix
      destination_address_prefix = security_rule.value.destination_address_prefix
    }
  }
}

locals {
  nsg_subnet_associations = flatten([
    for nsg_k, nsg_v in var.nsgs : [
      for subnet_id in nsg_v.associated_subnets : {
        nsg_key   = nsg_k
        subnet_id = subnet_id
      }
    ]
  ])
}

resource "azurerm_subnet_network_security_group_association" "nsg_association" {
  for_each = { for assoc in local.nsg_subnet_associations : "${assoc.nsg_key}_${assoc.subnet_id}" => assoc }

  subnet_id                 = each.value.subnet_id
  network_security_group_id = azurerm_network_security_group.nsg[each.value.nsg_key].id
}
