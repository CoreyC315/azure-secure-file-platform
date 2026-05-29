# =============================================================================
# modules/cosmos — the results store.
# Provisions a serverless Cosmos DB (NoSQL) account + database + container where
# the function writes extracted file metadata. Serverless = pay-per-RU, ideal for
# bursty/low-volume portfolio workloads. Data-plane access via managed identity,
# private endpoint in prod.
# =============================================================================

# TODO(milestone 3): azurerm_cosmosdb_account (Capabilities = EnableServerless, local auth disabled)
# TODO(milestone 3): azurerm_cosmosdb_sql_database "files"
# TODO(milestone 3): azurerm_cosmosdb_sql_container "results" (partition key /fileId)
# TODO(milestone 4): azurerm_cosmosdb_sql_role_assignment for the function identity
# TODO(milestone 5): azurerm_private_endpoint (documents) when enable_private_endpoints
