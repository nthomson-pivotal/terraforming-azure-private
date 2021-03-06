output "web_lb_name" {
  value = "${azurerm_lb.web.name}"
}

output "diego_ssh_lb_name" {
  value = "${azurerm_lb.diego-ssh.name}"
}

output "mysql_lb_name" {
  value = "${azurerm_lb.mysql.name}"
}

output "tcp_lb_name" {
  value = "${azurerm_lb.tcp.name}"
}

# Subnets

output "pas_subnet_name" {
  value = "${data.azurerm_subnet.pas_subnet.name}"
}

output "pas_subnet_cidr" {
  value = "${data.azurerm_subnet.pas_subnet.address_prefix}"
}

output "pas_subnet_gateway" {
  value = "${cidrhost(data.azurerm_subnet.pas_subnet.address_prefix, 1)}"
}

output "services_subnet_name" {
  value = "${data.azurerm_subnet.services_subnet.name}"
}

output "services_subnet_cidr" {
  value = "${data.azurerm_subnet.services_subnet.address_prefix}"
}

output "services_subnet_gateway" {
  value = "${cidrhost(data.azurerm_subnet.services_subnet.address_prefix, 1)}"
}

# Storage

output "cf_storage_account_name" {
  value = "${azurerm_storage_account.cf_storage_account.name}"
}

output "cf_storage_account_access_key" {
  sensitive = true
  value     = "${azurerm_storage_account.cf_storage_account.primary_access_key}"
}

output "cf_droplets_storage_container_name" {
  value = "${azurerm_storage_container.cf_droplets_storage_container.name}"
}

output "cf_packages_storage_container_name" {
  value = "${azurerm_storage_container.cf_packages_storage_container.name}"
}

output "cf_resources_storage_container_name" {
  value = "${azurerm_storage_container.cf_resources_storage_container.name}"
}

output "cf_buildpacks_storage_container_name" {
  value = "${azurerm_storage_container.cf_buildpacks_storage_container.name}"
}

# Deprecated

output "pas_subnet_cidrs" {
  value = ["${data.azurerm_subnet.pas_subnet.address_prefix}"]
}

output "services_subnet_cidrs" {
  value = ["${data.azurerm_subnet.services_subnet.address_prefix}"]
}
