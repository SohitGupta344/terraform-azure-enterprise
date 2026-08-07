# Virtual Network Module

This module creates Azure Virtual Networks based on a provided map configuration.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| `virtual_networks` | Map of virtual networks | `map(object({name=string, address_space=list(string), location=string, resource_group_name=string, tags=optional(map(string))}))` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| `virtual_networks` | Map containing created virtual network objects (id, name, resource_group_name, location). |
