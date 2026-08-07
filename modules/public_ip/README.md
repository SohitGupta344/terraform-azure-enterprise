# Public IP Module

This module creates Azure Public IPs.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| `public_ips` | Map of public IPs | `map(object({name=string, location=string, resource_group_name=string, allocation_method=string, sku=string, tags=optional(map(string))}))` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| `public_ips` | Map containing created public IP objects (id, name, ip_address). |
