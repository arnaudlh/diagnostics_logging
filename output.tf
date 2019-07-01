##export the logging details for EH and SA
##export one object with both
/*
output "eh_logs_id" {
  depends_on = [azurerm_eventhub_namespace.log]

  value = azurerm_eventhub_namespace.log.id
}

output "eh_logs_name" {
  depends_on = [azurerm_eventhub_namespace.log]

  value = azurerm_eventhub_namespace.log.name
}

output "sa_logs_id" {
  depends_on = [azurerm_storage_account.log]

  value = azurerm_storage_account.log.id
}
*/
output "diagnostics_map" {
    depends_on = [
        azurerm_storage_account.log, 
        azurerm_eventhub_namespace.log,
        azurerm_eventhub_namespace.log
        ]

    value = "${
        map(
            "diags_sa", "${azurerm_storage_account.log.id}",
            "eh_name",  "${azurerm_eventhub_namespace.log.name}",
            "eh_id", "${azurerm_eventhub_namespace.log.id}"
        )
    }"
}