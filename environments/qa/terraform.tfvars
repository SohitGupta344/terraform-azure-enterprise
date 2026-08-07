resource_groups = {
  rg1 = {
    name     = "sohit-enterprise-qa-rg"
    location = "centralindia"
    tags     = { environment = "qa" }
  }
}

virtual_networks = {
  vnet1 = {
    name                = "qa-vnet"
    address_space       = ["10.1.0.0/16"]
    location            = "centralindia"
    resource_group_name = "sohit-enterprise-qa-rg"
    tags                = { environment = "qa" }
  }
}

subnets = {
  frontend = {
    name                 = "frontend-vm-subnet"
    resource_group_name  = "sohit-enterprise-qa-rg"
    virtual_network_name = "qa-vnet"
    address_prefixes     = ["10.1.1.0/24"]
  }
  backend = {
    name                 = "backend-vm-subnet"
    resource_group_name  = "sohit-enterprise-qa-rg"
    virtual_network_name = "qa-vnet"
    address_prefixes     = ["10.1.2.0/24"]
  }
  appgw = {
    name                 = "application-gateway-subnet"
    resource_group_name  = "sohit-enterprise-qa-rg"
    virtual_network_name = "qa-vnet"
    address_prefixes     = ["10.1.3.0/24"]
  }
  bastion = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "sohit-enterprise-qa-rg"
    virtual_network_name = "qa-vnet"
    address_prefixes     = ["10.1.4.0/24"]
  }
}

nsgs = {
  nsg1 = {
    name                = "qa-nsg"
    location            = "centralindia"
    resource_group_name = "sohit-enterprise-qa-rg"
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
    tags = { environment = "qa" }
  }
}

public_ips = {
  appgw_pip = {
    name                = "qa-appgw-pip"
    location            = "centralindia"
    resource_group_name = "sohit-enterprise-qa-rg"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
  bastion_pip = {
    name                = "qa-bastion-pip"
    location            = "centralindia"
    resource_group_name = "sohit-enterprise-qa-rg"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
}

network_interfaces = {
  frontend_nic = {
    name                          = "qa-frontend-nic"
    location                      = "centralindia"
    resource_group_name           = "sohit-enterprise-qa-rg"
    subnet_id                     = "/subscriptions/ff8dbcde-c654-4f43-be29-1fa4ab0bad46/resourceGroups/sohit-enterprise-qa-rg/providers/Microsoft.Network/virtualNetworks/qa-vnet/subnets/frontend-vm-subnet"
    private_ip_address_allocation = "Dynamic"
  }
  backend_nic = {
    name                          = "qa-backend-nic"
    location                      = "centralindia"
    resource_group_name           = "sohit-enterprise-qa-rg"
    subnet_id                     = "/subscriptions/ff8dbcde-c654-4f43-be29-1fa4ab0bad46/resourceGroups/sohit-enterprise-qa-rg/providers/Microsoft.Network/virtualNetworks/qa-vnet/subnets/backend-vm-subnet"
    private_ip_address_allocation = "Dynamic"
  }
}

bastions = {
  bastion1 = {
    name                 = "qa-bastion"
    location             = "centralindia"
    resource_group_name  = "sohit-enterprise-qa-rg"
    public_ip_address_id = "/subscriptions/ff8dbcde-c654-4f43-be29-1fa4ab0bad46/resourceGroups/sohit-enterprise-qa-rg/providers/Microsoft.Network/publicIPAddresses/qa-bastion-pip"
    subnet_id            = "/subscriptions/ff8dbcde-c654-4f43-be29-1fa4ab0bad46/resourceGroups/sohit-enterprise-qa-rg/providers/Microsoft.Network/virtualNetworks/qa-vnet/subnets/AzureBastionSubnet"
  }
}

virtual_machines = {
  frontend_vm = {
    name                            = "qa-frontend-vm"
    location                        = "centralindia"
    resource_group_name             = "sohit-enterprise-qa-rg"
    network_interface_ids           = ["/subscriptions/ff8dbcde-c654-4f43-be29-1fa4ab0bad46/resourceGroups/sohit-enterprise-qa-rg/providers/Microsoft.Network/networkInterfaces/qa-frontend-nic"]
    size                            = "Standard_D2s_v3"
    admin_username                  = "azureuser"
    admin_password                  = "P@ssw0rd1234!"
    disable_password_authentication = false
    custom_data                     = "IyEvYmluL2Jhc2gKc3VkbyBhcHQtZ2V0IHVwZGF0ZSAteQpzdWRvIGFwdC1nZXQgaW5zdGFsbCBuZ2lueCAteQpzdWRvIHN5c3RlbWN0bCBlbmFibGUgbmdpbngKc3VkbyBzeXN0ZW1jdGwgc3RhcnQgbmdpbngKSE9TVE5BTUU9JChob3N0bmFtZSkKZWNobyAiPGgxPldlbGNvbWUgdG8gRW50ZXJwcmlzZSBBenVyZSBJbmZyYXN0cnVjdHVyZTwvaDE+PHA+U2VydmVyIEhvc3RuYW1lOiA8c3Ryb25nPiR7SE9TVE5BTUV9PC9zdHJvbmc+PC9wPiIgfCBzdWRvIHRlZSAvdmFyL3d3dy9odG1sL2luZGV4Lmh0bWw="
  }
  backend_vm = {
    name                            = "qa-backend-vm"
    location                        = "centralindia"
    resource_group_name             = "sohit-enterprise-qa-rg"
    network_interface_ids           = ["/subscriptions/ff8dbcde-c654-4f43-be29-1fa4ab0bad46/resourceGroups/sohit-enterprise-qa-rg/providers/Microsoft.Network/networkInterfaces/qa-backend-nic"]
    size                            = "Standard_D2s_v3"
    admin_username                  = "azureuser"
    admin_password                  = "P@ssw0rd1234!"
    disable_password_authentication = false
    custom_data                     = "IyEvYmluL2Jhc2gKc3VkbyBhcHQtZ2V0IHVwZGF0ZSAteQpzdWRvIGFwdC1nZXQgaW5zdGFsbCBuZ2lueCAteQpzdWRvIHN5c3RlbWN0bCBlbmFibGUgbmdpbngKc3VkbyBzeXN0ZW1jdGwgc3RhcnQgbmdpbngKSE9TVE5BTUU9JChob3N0bmFtZSkKZWNobyAiPGgxPldlbGNvbWUgdG8gRW50ZXJwcmlzZSBBenVyZSBJbmZyYXN0cnVjdHVyZTwvaDE+PHA+U2VydmVyIEhvc3RuYW1lOiA8c3Ryb25nPiR7SE9TVE5BTUV9PC9zdHJvbmc+PC9wPiIgfCBzdWRvIHRlZSAvdmFyL3d3dy9odG1sL2luZGV4Lmh0bWw="
  }
}

application_gateways = {
  appgw1 = {
    name                 = "qa-appgw"
    location             = "centralindia"
    resource_group_name  = "sohit-enterprise-qa-rg"
    subnet_id            = "/subscriptions/ff8dbcde-c654-4f43-be29-1fa4ab0bad46/resourceGroups/sohit-enterprise-qa-rg/providers/Microsoft.Network/virtualNetworks/qa-vnet/subnets/application-gateway-subnet"
    public_ip_address_id = "/subscriptions/ff8dbcde-c654-4f43-be29-1fa4ab0bad46/resourceGroups/sohit-enterprise-qa-rg/providers/Microsoft.Network/publicIPAddresses/qa-appgw-pip"
    backend_ip_addresses = ["10.1.1.4", "10.1.2.4"]
  }
}
