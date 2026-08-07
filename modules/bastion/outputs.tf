output "bastions" {
  description = "A map containing the created Azure Bastion hosts."
  value = {
    for k, bastion in azurerm_bastion_host.bastion : k => {
      id   = bastion.id
      name = bastion.name
    }
  }
}
