resource "azurerm_postgresql_server" "this" {
  name                = "${var.prefix}postgres-geo"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name

  administrator_login          = "mysqladminun"
  administrator_login_password = "H@Sh1CoR3!!!"

  sku_name   = "GP_Gen5_2"
  storage_mb = 5120
  version    = "9.6"

  auto_grow_enabled                 = true
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = true
  infrastructure_encryption_enabled = false
  public_network_access_enabled     = true
  ssl_enforcement_enabled           = true
  ssl_minimal_tls_version_enforced  = "TLS1_2"

  tags = var.tags
}
