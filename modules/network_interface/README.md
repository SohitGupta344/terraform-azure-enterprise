# Network Interface Module

This module creates Azure Network Interfaces (NICs) with optional Public IP and NSG association.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| `network_interfaces` | Map of NICs | `map(object({...}))` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| `network_interfaces` | Map containing created NIC objects (id, name, private_ip_address). |
