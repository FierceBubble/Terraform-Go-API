terraform {
  required_version = ">= 0.13.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = var.azure_subscription_id
  tenant_id       = var.azure_tenant_id
}

resource "azurerm_resource_group" "rg" {
  name     = var.azure_rg_name
  location = var.azure_rg_location
}

module "network" {
  source      = "./network"
  rg_name     = azurerm_resource_group.rg.name
  rg_location = azurerm_resource_group.rg.location
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                            = var.azure_vm_name
  resource_group_name             = azurerm_resource_group.rg.name
  location                        = azurerm_resource_group.rg.location
  size                            = var.azure_vm_size
  computer_name                   = var.azure_vm_host_name
  admin_username                  = var.azure_admin_username
  admin_password                  = var.azure_admin_password
  disable_password_authentication = var.azure_vm_disable_password

  network_interface_ids = [
    module.network.nic_id,
  ]

  os_disk {
    caching              = var.azure_vm_os_disk_caching
    storage_account_type = var.azure_vm_os_disk_type
    disk_size_gb         = var.azure_vm_os_disk_size
  }

  source_image_reference {
    publisher = var.azure_vm_image_publisher
    offer     = var.azure_vm_image_offer
    sku       = var.azure_vm_image_sku
    version   = var.azure_vm_image_version
  }
}
