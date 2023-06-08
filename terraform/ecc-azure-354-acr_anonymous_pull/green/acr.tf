resource "azurerm_resource_group" "this" {
  name     = "${var.prefix}-rg-green"
  location = var.location
  tags     = var.tags
}

resource "azurerm_container_registry" "this" {
  name                = "acr${var.prefix}green"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  sku                 = "Standard"

  anonymous_pull_enabled = false

  tags = var.tags
}