# Application Gateway Module

This module creates an Azure Application Gateway (Standard_v2).

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| `application_gateways` | Map of application gateways | `map(object({...}))` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| `application_gateways` | Map containing created App Gateway objects (id, name). |
