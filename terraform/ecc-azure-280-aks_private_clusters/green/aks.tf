resource "azurerm_resource_group" "this" {
  name     = "${var.prefix}-rg-green"
  location = var.location
  tags     = var.tags
}

resource "azurerm_user_assigned_identity" "this" {
  name                = "aks-${var.prefix}-identity"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
}

resource "azurerm_kubernetes_cluster" "this" {
  name                    = "${var.prefix}kuber"
  location                = azurerm_resource_group.this.location
  resource_group_name     = azurerm_resource_group.this.name
  dns_prefix              = "aksthisdnsprefix1"
  private_cluster_enabled = true

  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }
}
