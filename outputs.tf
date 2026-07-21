output "key_vault_id" {
  description = "The resource ID of the Key Vault."
  value       = azurerm_key_vault.kv.id
}

output "key_vault_name" {
  description = "The name of the Key Vault."
  value       = azurerm_key_vault.kv.name
}

output "key_vault_uri" {
  description = "The URI of the Key Vault for secret access."
  value       = azurerm_key_vault.kv.vault_uri
}

output "resource_group_name" {
  description = "The name of the resource group."
  value       = azurerm_resource_group.kv_rg.name
}
