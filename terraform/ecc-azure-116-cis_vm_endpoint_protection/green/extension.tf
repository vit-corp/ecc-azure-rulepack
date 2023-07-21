resource "azurerm_virtual_machine_extension" "this" {
  name                 = "IaaSAntimalware"
  virtual_machine_id   = azurerm_windows_virtual_machine.this.id
  publisher            = "Microsoft.Azure.Security"
  type                 = "IaaSAntimalware"
  type_handler_version = "1.3"

  settings = <<SETTINGS
    {
      "AntimalwareEnabled": true,
      "RealtimeProtectionEnabled": "false",
      "ScheduledScanSettings": {
          "isEnabled": "false",
          "day": "7",
          "time": "120",
          "scanType": "Quick"
      },
      "Exclusions": {
          "Extensions": "",
          "Paths": "",
          "Processes": ""
      }
    }
  SETTINGS

  depends_on = [azurerm_windows_virtual_machine.this]

  tags = var.tags
}
