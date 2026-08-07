# Virtual Machine Module

This module creates Azure Linux Virtual Machines.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| `virtual_machines` | Map of virtual machines | `map(object({...}))` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| `virtual_machines` | Map containing created virtual machine objects (id, name, private_ip). |
