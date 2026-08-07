resource_groups = {
  rg1 = {
    name     = "sohit-enterprise-prod-rg"
    location = "centralindia"
    tags     = { environment = "prod" }
  }
}

virtual_networks = {
  vnet1 = {
    name                = "prod-vnet"
    address_space       = ["10.2.0.0/16"]
    location            = "centralindia"
    resource_group_name = "sohit-enterprise-prod-rg"
    tags                = { environment = "prod" }
  }
}

subnets = {
  frontend = {
    name                 = "frontend-vm-subnet"
    resource_group_name  = "sohit-enterprise-prod-rg"
    virtual_network_name = "prod-vnet"
    address_prefixes     = ["10.2.1.0/24"]
  }
  backend = {
    name                 = "backend-vm-subnet"
    resource_group_name  = "sohit-enterprise-prod-rg"
    virtual_network_name = "prod-vnet"
    address_prefixes     = ["10.2.2.0/24"]
  }
  appgw = {
    name                 = "application-gateway-subnet"
    resource_group_name  = "sohit-enterprise-prod-rg"
    virtual_network_name = "prod-vnet"
    address_prefixes     = ["10.2.3.0/24"]
  }
  bastion = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "sohit-enterprise-prod-rg"
    virtual_network_name = "prod-vnet"
    address_prefixes     = ["10.2.4.0/24"]
  }
}

nsgs = {
  nsg1 = {
    name                = "prod-nsg"
    location            = "centralindia"
    resource_group_name = "sohit-enterprise-prod-rg"
    security_rules = [
      {
        name                       = "allow-ssh"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "allow-http"
        priority                   = 110
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "allow-https"
        priority                   = 120
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
    tags = { environment = "prod" }
  }
}

public_ips = {
  appgw_pip = {
    name                = "prod-appgw-pip"
    location            = "centralindia"
    resource_group_name = "sohit-enterprise-prod-rg"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
  bastion_pip = {
    name                = "prod-bastion-pip"
    location            = "centralindia"
    resource_group_name = "sohit-enterprise-prod-rg"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
}

network_interfaces = {
  frontend_nic = {
    name                          = "prod-frontend-nic"
    location                      = "centralindia"
    resource_group_name           = "sohit-enterprise-prod-rg"
    subnet_id                     = "/subscriptions/ff8dbcde-c654-4f43-be29-1fa4ab0bad46/resourceGroups/sohit-enterprise-prod-rg/providers/Microsoft.Network/virtualNetworks/prod-vnet/subnets/frontend-vm-subnet"
    private_ip_address_allocation = "Dynamic"
  }
  backend_nic = {
    name                          = "prod-backend-nic"
    location                      = "centralindia"
    resource_group_name           = "sohit-enterprise-prod-rg"
    subnet_id                     = "/subscriptions/ff8dbcde-c654-4f43-be29-1fa4ab0bad46/resourceGroups/sohit-enterprise-prod-rg/providers/Microsoft.Network/virtualNetworks/prod-vnet/subnets/backend-vm-subnet"
    private_ip_address_allocation = "Dynamic"
  }
}

bastions = {
  bastion1 = {
    name                 = "prod-bastion"
    location             = "centralindia"
    resource_group_name  = "sohit-enterprise-prod-rg"
    public_ip_address_id = "/subscriptions/ff8dbcde-c654-4f43-be29-1fa4ab0bad46/resourceGroups/sohit-enterprise-prod-rg/providers/Microsoft.Network/publicIPAddresses/prod-bastion-pip"
    subnet_id            = "/subscriptions/ff8dbcde-c654-4f43-be29-1fa4ab0bad46/resourceGroups/sohit-enterprise-prod-rg/providers/Microsoft.Network/virtualNetworks/prod-vnet/subnets/AzureBastionSubnet"
  }
}

virtual_machines = {
  frontend_vm = {
    name                            = "prod-frontend-vm"
    location                        = "centralindia"
    resource_group_name             = "sohit-enterprise-prod-rg"
    network_interface_ids           = ["/subscriptions/ff8dbcde-c654-4f43-be29-1fa4ab0bad46/resourceGroups/sohit-enterprise-prod-rg/providers/Microsoft.Network/networkInterfaces/prod-frontend-nic"]
    size                            = "Standard_D2s_v3"
    admin_username                  = "azureuser"
    admin_password                  = "P@ssw0rd1234!"
    disable_password_authentication = false
    custom_data                     = "IyEvYmluL2Jhc2gKc3VkbyBhcHQtZ2V0IHVwZGF0ZSAteQpzdWRvIGFwdC1nZXQgaW5zdGFsbCBuZ2lueCAteQpzdWRvIHN5c3RlbWN0bCBlbmFibGUgbmdpbngKc3VkbyBzeXN0ZW1jdGwgc3RhcnQgbmdpbngKSE9TVE5BTUU9JChob3N0bmFtZSkKZWNobyAiPGgxPldlbGNvbWUgdG8gRW50ZXJwcmlzZSBBenVyZSBJbmZyYXN0cnVjdHVyZTwvaDE+PHA+U2VydmVyIEhvc3RuYW1lOiA8c3Ryb25nPiR7SE9TVE5BTUV9PC9zdHJvbmc+PC9wPiIgfCBzdWRvIHRlZSAvdmFyL3d3dy9odG1sL2luZGV4Lmh0bWw="
  }
  backend_vm = {
    name                            = "prod-backend-vm"
    location                        = "centralindia"
    resource_group_name             = "sohit-enterprise-prod-rg"
    network_interface_ids           = ["/subscriptions/ff8dbcde-c654-4f43-be29-1fa4ab0bad46/resourceGroups/sohit-enterprise-prod-rg/providers/Microsoft.Network/networkInterfaces/prod-backend-nic"]
    size                            = "Standard_D2s_v3"
    admin_username                  = "azureuser"
    admin_password                  = "P@ssw0rd1234!"
    disable_password_authentication = false
    custom_data                     = "IyEvYmluL2Jhc2gKc3VkbyBhcHQtZ2V0IHVwZGF0ZSAteQpzdWRvIGFwdC1nZXQgaW5zdGFsbCBuZ2lueCAteQpzdWRvIHN5c3RlbWN0bCBlbmFibGUgbmdpbngKc3VkbyBzeXN0ZW1jdGwgc3RhcnQgbmdpbngKSE9TVE5BTUU9JChob3N0bmFtZSkKZWNobyAiPGgxPldlbGNvbWUgdG8gRW50ZXJwcmlzZSBBenVyZSBJbmZyYXN0cnVjdHVyZTwvaDE+PHA+U2VydmVyIEhvc3RuYW1lOiA8c3Ryb25nPiR7SE9TVE5BTUV9PC9zdHJvbmc+PC9wPiIgfCBzdWRvIHRlZSAvdmFyL3d3dy9odG1sL2luZGV4Lmh0bWw="
  }
}

application_gateways = {
  appgw1 = {
    name                 = "prod-appgw"
    location             = "centralindia"
    resource_group_name  = "sohit-enterprise-prod-rg"
    subnet_id            = "/subscriptions/ff8dbcde-c654-4f43-be29-1fa4ab0bad46/resourceGroups/sohit-enterprise-prod-rg/providers/Microsoft.Network/virtualNetworks/prod-vnet/subnets/application-gateway-subnet"
    public_ip_address_id = "/subscriptions/ff8dbcde-c654-4f43-be29-1fa4ab0bad46/resourceGroups/sohit-enterprise-prod-rg/providers/Microsoft.Network/publicIPAddresses/prod-appgw-pip"
    backend_ip_addresses = ["10.2.1.4", "10.2.2.4"]
  }
}
