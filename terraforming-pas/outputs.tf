output "iaas" {
  value = "azure"
}

output "subscription_id" {
  sensitive = true
  value     = "${var.subscription_id}"
}

output "tenant_id" {
  sensitive = true
  value     = "${var.tenant_id}"
}

output "client_id" {
  sensitive = true
  value     = "${var.client_id}"
}

output "client_secret" {
  sensitive = true
  value     = "${var.client_secret}"
}

output "ssl_cert" {
  sensitive = true
  value     = "${length(module.certs.ssl_cert) > 0 ? module.certs.ssl_cert : var.ssl_cert}"
}

output "ssl_private_key" {
  sensitive = true
  value     = "${length(module.certs.ssl_private_key) > 0 ? module.certs.ssl_private_key : var.ssl_private_key}"
}

output "web_lb_name" {
  value = "${module.pas.web_lb_name}"
}

output "diego_ssh_lb_name" {
  value = "${module.pas.diego_ssh_lb_name}"
}

output "mysql_lb_name" {
  value = "${module.pas.mysql_lb_name}"
}

output "tcp_lb_name" {
  value = "${module.pas.tcp_lb_name}"
}

output "network_name" {
  value = "${var.vnet_name}"
}
# TODO(cdutra): PAS

output "bosh_root_storage_account" {
  value = "${module.infra.bosh_root_storage_account}"
}

output "ops_manager_storage_account" {
  value = "${module.ops_manager.ops_manager_storage_account}"
}

output "cf_storage_account_name" {
  value = "${module.pas.cf_storage_account_name}"
}

output "cf_storage_account_access_key" {
  sensitive = true
  value     = "${module.pas.cf_storage_account_access_key}"
}

output "cf_droplets_storage_container" {
  value = "${module.pas.cf_droplets_storage_container_name}"
}

output "cf_packages_storage_container" {
  value = "${module.pas.cf_packages_storage_container_name}"
}

output "cf_resources_storage_container" {
  value = "${module.pas.cf_resources_storage_container_name}"
}

output "cf_buildpacks_storage_container" {
  value = "${module.pas.cf_buildpacks_storage_container_name}"
}

output "ops_manager_ssh_public_key" {
  sensitive = true
  value     = "${module.ops_manager.ops_manager_ssh_public_key}"
}

output "ops_manager_ssh_private_key" {
  sensitive = true
  value     = "${module.ops_manager.ops_manager_ssh_private_key}"
}

output "ops_manager_private_ip" {
  value = "${module.ops_manager.ops_manager_private_ip}"
}