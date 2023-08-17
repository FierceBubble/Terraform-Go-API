resource "azurerm_network_security_group" "nsg" {
  name                = var.azure_nsg_name
  location            = var.rg_location
  resource_group_name = var.rg_name
}

resource "azurerm_network_security_rule" "ssh" {
  resource_group_name         = var.rg_name
  network_security_group_name = azurerm_network_security_group.nsg.name

  name                   = "ssh"
  priority               = 100
  direction              = "Inbound"
  access                 = "Allow"
  protocol               = "Tcp"
  source_port_range      = "*"
  destination_port_range = "22"

  source_address_prefix      = "*"
  destination_address_prefix = "*"
}

resource "azurerm_network_security_rule" "http" {
  resource_group_name         = var.rg_name
  network_security_group_name = azurerm_network_security_group.nsg.name

  name                   = "http"
  priority               = 200
  direction              = "Inbound"
  access                 = "Allow"
  protocol               = "Tcp"
  source_port_range      = "*"
  destination_port_range = "80"

  source_address_prefix      = "*"
  destination_address_prefix = "*"
}

resource "azurerm_network_security_rule" "https" {
  resource_group_name         = var.rg_name
  network_security_group_name = azurerm_network_security_group.nsg.name

  name                   = "https"
  priority               = 300
  direction              = "Inbound"
  access                 = "Allow"
  protocol               = "Tcp"
  source_port_range      = "*"
  destination_port_range = "443"

  source_address_prefix      = "*"
  destination_address_prefix = "*"
}

resource "azurerm_network_security_rule" "agent" {
  resource_group_name         = var.rg_name
  network_security_group_name = azurerm_network_security_group.nsg.name

  name                   = "agent"
  priority               = 400
  direction              = "Inbound"
  access                 = "Allow"
  protocol               = "Tcp"
  source_port_range      = "*"
  destination_port_range = "34210"

  source_address_prefix      = "*"
  destination_address_prefix = "*"
}
