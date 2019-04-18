provider "azurerm" {
  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  tenant_id       = "${var.tenant_id}"
  environment     = "${var.cloud_name}"

  version = "~> 1.22"
}

terraform {
  required_version = "< 0.12.0"
}

module "infra" {
  source = "../modules/infra"

  env_name                          = "${var.env_name}"
  location                          = "${var.location}"
  pcf_infrastructure_subnet         = "${var.pcf_infrastructure_subnet}"
  pcf_virtual_network_address_space = "${var.pcf_virtual_network_address_space}"

  vnet_name                         = "${var.vnet_name}"
  infrastructure_subnet_name        = "${var.infrastructure_subnet_name}"
  resource_group_name               = "${var.resource_group_name}"
}

module "ops_manager" {
  source = "../modules/ops_manager"

  env_name = "${var.env_name}"
  location = "${var.location}"

  vm_count               = "${var.ops_manager_vm == false ? 0 : (var.ops_manager_image_uri == "" ? 0 : 1)}"
  ops_manager_image_uri  = "${var.ops_manager_image_uri}"
  ops_manager_vm_size    = "${var.ops_manager_vm_size}"
  ops_manager_private_ip = "${var.ops_manager_private_ip}"

  optional_ops_manager_image_uri = "${var.optional_ops_manager_image_uri}"

  resource_group_name = "${module.infra.resource_group_name}"
  subnet_id           = "${module.infra.infrastructure_subnet_id}"
}

module "pas" {
  source = "../modules/pas"

  env_name = "${var.env_name}"
  location = "${var.location}"

  cf_storage_account_name              = "${var.cf_storage_account_name}"
  cf_buildpacks_storage_container_name = "${var.cf_buildpacks_storage_container_name}"
  cf_droplets_storage_container_name   = "${var.cf_droplets_storage_container_name}"
  cf_packages_storage_container_name   = "${var.cf_packages_storage_container_name}"
  cf_resources_storage_container_name  = "${var.cf_resources_storage_container_name}"

  resource_group_name                 = "${module.infra.resource_group_name}"
  network_name                        = "${module.infra.network_name}"

  pas_subnet_name        = "${var.pas_subnet_name}"
  services_subnet_name        = "${var.services_subnet_name}"
}

module "certs" {
  source = "../modules/certs"

  env_name           = "${var.env_name}"
  ssl_ca_cert        = "${var.ssl_ca_cert}"
  ssl_ca_private_key = "${var.ssl_ca_private_key}"
}
