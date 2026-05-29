# =============================================================================
# modules/keyvault — secrets & config store.
# Provisions a Key Vault using RBAC authorization (not legacy access policies).
# The Function App's managed identity is granted `Key Vault Secrets User`; app
# config/secrets live here instead of in app settings. Private endpoint in prod.
# =============================================================================

# TODO(milestone 5): azurerm_key_vault (enable_rbac_authorization = true, purge protection)
# TODO(milestone 5): azurerm_role_assignment "Key Vault Secrets User" -> function identity
# TODO(milestone 5): azurerm_private_endpoint (vault) when enable_private_endpoints
