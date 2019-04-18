# ================================= Subnets ====================================

data "azurerm_subnet" "pas_subnet" {
  name                 = "${var.pas_subnet_name}"
  virtual_network_name = "${var.network_name}"
  resource_group_name  = "${var.resource_group_name}"
}

data "azurerm_subnet" "services_subnet" {
  name                 = "${var.services_subnet_name}"
  virtual_network_name = "${var.network_name}"
  resource_group_name  = "${var.resource_group_name}"
}