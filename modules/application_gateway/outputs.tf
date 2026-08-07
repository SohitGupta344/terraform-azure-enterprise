output "application_gateways" {
  description = "A map containing the created application gateways."
  value = {
    for k, appgw in azurerm_application_gateway.appgw : k => {
      id   = appgw.id
      name = appgw.name
    }
  }
}
