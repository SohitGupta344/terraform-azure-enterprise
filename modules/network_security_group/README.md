# Network Security Group Module

This module creates Azure NSGs with dynamic security rules and associates them with subnets.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| `nsgs` | Map of NSGs, rules, and subnet associations | `map(object({...}))` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| `network_security_groups` | Map containing created NSG objects (id, name). |
