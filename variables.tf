variable "environment" {
  description = "The environment of the service (e.g., staging, production)."
  type        = string
}

variable "location" {
  description = "Azure region where resources will be deployed."
  type        = string
}

variable "company" {
  description = "Company name for tagging."
  type        = string
}

variable "business_partner" {
  description = "Business partner for tagging."
  type        = string
}

variable "description" {
  description = "Description of the service for tagging."
  type        = string
}

variable "owner_group" {
  description = "Owner group for tagging."
  type        = string
}

variable "owner_group_email" {
  description = "Owner group email for tagging."
  type        = string
}

variable "repository" {
  description = "Repository path for tagging."
  type        = string
}

variable "tenant_id" {
  description = "Azure Tenant ID. Required by azurerm_key_vault."
  type        = string
}

variable "resource_group_config" {
  description = "Resource group configuration for the Key Vault."
  type = object({
    name     = string
    location = string
  })
}

variable "key_vault_config" {
  description = "Key Vault configuration."
  type = object({
    name                          = string
    sku_name                      = string
    soft_delete_retention_days    = number
    purge_protection_enabled      = bool
    enable_rbac_authorization     = bool
    public_network_access_enabled = bool
  })
}

variable "network_acls_config" {
  description = "Network ACL configuration. default_action is always Deny. Configure bypass, ip_rules, and virtual_network_subnet_ids as needed."
  type = object({
    bypass                     = string
    ip_rules                   = list(string)
    virtual_network_subnet_ids = list(string)
  })
  default = {
    bypass                     = "AzureServices"
    ip_rules                   = []
    virtual_network_subnet_ids = []
  }
}

