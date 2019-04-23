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

# ============= DNS

locals {
  dns_subdomain = "${var.env_name}"
}

output "resource_group_name" {
  value = "${data.azurerm_resource_group.pcf_resource_group.name}"
}