resource "azurerm_linux_virtual_machine_scale_set" "this" {
  name                            = "lss${var.prefix}-red"
  resource_group_name             = azurerm_resource_group.this.name
  location                        = azurerm_resource_group.this.location
  sku                             = "Standard_B1s"
  disable_password_authentication = false
  admin_username                  = random_string.this.result
  admin_password                  = random_password.this.result
  instances                       = 1

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  network_interface {
    name    = "linuxvmssnic"
    primary = true

    ip_configuration {
      name      = "linuxvmssipconf"
      primary   = true
      subnet_id = azurerm_subnet.linuxvmss.id
    }
  }

  tags = var.tags
}