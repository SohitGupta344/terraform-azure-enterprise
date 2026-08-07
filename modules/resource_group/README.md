# Resource Group Module

This module creates Azure Resource Groups based on a provided map configuration.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| `resource_groups` | Map of resource groups | `map(object({name=string, location=string, tags=optional(map(string))}))` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| `resource_groups` | Map containing created resource group objects (id, name, location). |
