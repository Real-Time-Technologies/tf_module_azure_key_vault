//noinspection MissingModule
module "common_tags" {
  source            = "git::https://github.com/Real-Time-Technologies/tf_module_azure_common_tags.git"
  business_partner  = var.business_partner
  company           = var.company
  description       = var.description
  environment       = var.environment
  owner_group       = var.owner_group
  owner_group_email = var.owner_group_email
  location          = var.location
  repository        = var.repository
}

resource "azurerm_resource_group" "kv_rg" {
  name     = var.resource_group_config.name
  location = var.resource_group_config.location

  tags = module.common_tags.common_tags

  lifecycle {
    ignore_changes = [tags["deployed_on"]]
  }
}

resource "azurerm_key_vault" "kv" {
  name                = var.key_vault_config.name
  resource_group_name = azurerm_resource_group.kv_rg.name
  location            = azurerm_resource_group.kv_rg.location
  tenant_id           = var.tenant_id

  sku_name = var.key_vault_config.sku_name

  soft_delete_retention_days    = var.key_vault_config.soft_delete_retention_days
  purge_protection_enabled      = var.key_vault_config.purge_protection_enabled
  enable_rbac_authorization     = var.key_vault_config.enable_rbac_authorization
  public_network_access_enabled = var.key_vault_config.public_network_access_enabled

  tags = module.common_tags.common_tags

  lifecycle {
    ignore_changes = [tags["deployed_on"]]
  }
}
