# Bastion Module

This module creates Azure Bastion Hosts.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| `bastions` | Map of Bastion hosts | `map(object({...}))` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| `bastions` | Map containing created Bastion host objects (id, name). |
