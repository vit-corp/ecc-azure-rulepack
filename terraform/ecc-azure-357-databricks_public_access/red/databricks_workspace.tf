resource "azurerm_databricks_workspace" "this" {
  name                = "${var.prefix}databricks-red"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  sku                 = "standard"

  tags = var.tags
}