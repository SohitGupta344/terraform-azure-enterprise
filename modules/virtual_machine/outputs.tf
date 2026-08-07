output "virtual_machines" {
  description = "A map containing the created virtual machines."
  value = {
    for k, vm in azurerm_linux_virtual_machine.vm : k => {
      id         = vm.id
      name       = vm.name
      private_ip = vm.private_ip_address
    }
  }
}
