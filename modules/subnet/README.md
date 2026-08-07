# Subnet Module

This module creates Azure Subnets based on a provided map configuration.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| `subnets` | Map of subnets | `map(object({name=string, resource_group_name=string, virtual_network_name=string, address_prefixes=list(string)}))` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| `subnets` | Map containing created subnet objects (id, name, virtual_network_name). |
