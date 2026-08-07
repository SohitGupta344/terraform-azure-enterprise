output "resource_groups" {
  description = "A map containing the created resource groups."
  value = {
    for k, rg in azurerm_resource_group.rg : k => {
      id       = rg.id
      name     = rg.name
      location = rg.location
    }
  }
}
