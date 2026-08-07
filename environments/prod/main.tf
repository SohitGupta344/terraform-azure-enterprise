module "resource_group" {
  source          = "../../modules/resource_group"
  resource_groups = var.resource_groups
}

module "virtual_network" {
  source           = "../../modules/virtual_network"
  virtual_networks = var.virtual_networks

  depends_on = [module.resource_group]
}

module "subnet" {
  source  = "../../modules/subnet"
  subnets = var.subnets

  depends_on = [module.virtual_network]
}

module "network_security_group" {
  source = "../../modules/network_security_group"
  nsgs   = var.nsgs

  depends_on = [module.subnet]
}

module "public_ip" {
  source     = "../../modules/public_ip"
  public_ips = var.public_ips

  depends_on = [module.resource_group]
}

module "network_interface" {
  source             = "../../modules/network_interface"
  network_interfaces = var.network_interfaces

  depends_on = [module.subnet, module.public_ip, module.network_security_group]
}

module "bastion" {
  source   = "../../modules/bastion"
  bastions = var.bastions

  depends_on = [module.subnet, module.public_ip]
}

module "virtual_machine" {
  source           = "../../modules/virtual_machine"
  virtual_machines = var.virtual_machines

  depends_on = [module.network_interface]
}

module "application_gateway" {
  source               = "../../modules/application_gateway"
  application_gateways = var.application_gateways

  depends_on = [module.subnet, module.public_ip, module.virtual_machine]
}
