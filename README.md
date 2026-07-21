# tf_module_azure_key_vault

Reusable Terraform module for provisioning an Azure Key Vault and its resource group with standardized tagging via `tf_module_azure_common_tags`.

## Resources

| Resource | Description |
|---|---|
| `azurerm_resource_group` | Resource group for the Key Vault |
| `azurerm_key_vault` | Azure Key Vault |

## Usage

```hcl
module "key_vault" {
  source = "git::https://github.com/Real-Time-Technologies/tf_module_azure_key_vault.git?ref=1.0.0"

  company           = "rtpay"
  environment       = var.environment
  location          = var.location
  business_partner  = "internal"
  description       = "Key vault for staging secrets"
  owner_group       = "sre"
  owner_group_email = "sre@rt2.com"
  repository        = "RT-Qpay-Iac-Core-Services/region/key-vault"
  tenant_id         = data.azurerm_client_config.current.tenant_id

  resource_group_config = {
    name     = "rtpay-scr-staging-east-rg"
    location = "eastus"
  }

  key_vault_config = {
    name                          = "rtpay-scr-staging-east-kv"
    sku_name                      = "standard"
    soft_delete_retention_days    = 90
    purge_protection_enabled      = false
    enable_rbac_authorization     = true
    public_network_access_enabled = true
  }
}
```

## Inputs

| Name | Description | Type | Required |
|---|---|---|---|
| `environment` | Environment name | `string` | yes |
| `location` | Azure region | `string` | yes |
| `company` | Company name for tagging | `string` | yes |
| `business_partner` | Business partner for tagging | `string` | yes |
| `description` | Description for tagging | `string` | yes |
| `owner_group` | Owner group for tagging | `string` | yes |
| `owner_group_email` | Owner group email for tagging | `string` | yes |
| `repository` | Repository path for tagging | `string` | yes |
| `tenant_id` | Azure Tenant ID | `string` | yes |
| `resource_group_config` | Resource group name + location | `object` | yes |
| `key_vault_config` | Key Vault settings | `object` | yes |

## Outputs

| Name | Description |
|---|---|
| `key_vault_id` | Resource ID of the Key Vault |
| `key_vault_name` | Name of the Key Vault |
| `key_vault_uri` | URI of the Key Vault |
| `resource_group_name` | Name of the resource group |

## Provider

Requires `azurerm = 3.103.1`.
