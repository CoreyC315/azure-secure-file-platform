# =============================================================================
# modules/function_app — the compute heart of the platform.
# Provisions the Azure Functions Flex Consumption app (+ its own storage account),
# a system-assigned managed identity, VNet integration, App Insights wiring, and
# the RBAC role assignments that let the identity reach Storage, Cosmos, and Key
# Vault WITHOUT any keys or connection strings.
#
# ⚠️ Flex Consumption gotcha (see docs/runbook.md): with identity-only storage,
# use AzureWebJobsStorage__accountName + __credential=managedidentity, NOT a
# connection string, or the host fails to acquire its lock lease on startup.
# =============================================================================

# TODO(milestone 4): azurerm_storage_account (function backing store, identity-only)
# TODO(milestone 4): azurerm_function_app_flex_consumption (Python, runtime + memory size)
#   - identity { type = "SystemAssigned" }
#   - vnet integration -> functions subnet
#   - app settings: APPLICATIONINSIGHTS_CONNECTION_STRING, AzureWebJobsStorage__*, COSMOS_*
# TODO(milestone 4): role assignments for the app identity:
#   - Storage Blob Data Contributor (landing + backing accounts)
#   - Cosmos DB data-plane role
#   - Monitoring Metrics Publisher
