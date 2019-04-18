variable "env_name" {
  default = ""
}

variable "resource_group_name" {

}

variable "infrastructure_subnet_name" {

}

variable "vnet_name" {

}

variable "location" {
  default = ""
}

variable "dns_subdomain" {
  default = ""
}

variable "dns_suffix" {
  default = ""
}

variable "pcf_virtual_network_address_space" {
  type    = "list"
  default = []
}

variable "pcf_infrastructure_subnet" {
  default = ""
}

data "azurerm_resource_group" "pcf_resource_group" {
  name = "${var.resource_group_name}"
}

# ============= Networking

data "azurerm_virtual_network" "pcf_virtual_network" {
  name                = "${var.vnet_name}"
  resource_group_name = "${data.azurerm_resource_group.pcf_resource_group.name}"
}

data "azurerm_subnet" "infrastructure_subnet" {
  name                 = "${var.infrastructure_subnet_name}"
  virtual_network_name = "${data.azurerm_virtual_network.pcf_virtual_network.name}"
  resource_group_name  = "${data.azurerm_resource_group.pcf_resource_group.name}"
}

# ============= DNS

locals {
  dns_subdomain = "${var.env_name}"
}

output "resource_group_name" {
  value = "${data.azurerm_resource_group.pcf_resource_group.name}"
}

output "network_name" {
  value = "${data.azurerm_virtual_network.pcf_virtual_network.name}"
}

output "infrastructure_subnet_id" {
  value = "${data.azurerm_subnet.infrastructure_subnet.id}"
}

output "infrastructure_subnet_name" {
  value = "${data.azurerm_subnet.infrastructure_subnet.name}"
}

output "infrastructure_subnet_cidr" {
  value = "${data.azurerm_subnet.infrastructure_subnet.address_prefix}"
}

output "infrastructure_subnet_gateway" {
  value = "${cidrhost(data.azurerm_subnet.infrastructure_subnet.address_prefix, 1)}"
}

# Deprecated

output "infrastructure_subnet_cidrs" {
  value = ["${data.azurerm_subnet.infrastructure_subnet.address_prefix}"]
}
