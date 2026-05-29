# =============================================================================
# modules/storage — the ingestion surface.
# Provisions the Storage Account + `landing` blob container that users upload to.
# Identity-only (shared_access_key_enabled = false), TLS1.2, public access off,
# optional private endpoint, and the Event Grid wiring that fires the function on
# new blobs. This is the entry point of the whole pipeline.
# =============================================================================

# TODO(milestone 3): azurerm_storage_account (StorageV2, LRS, identity-only, TLS1.2)
# TODO(milestone 3): azurerm_storage_container "landing"
# TODO(milestone 3): azurerm_eventgrid_system_topic + blob-created subscription -> function
# TODO(milestone 5): azurerm_private_endpoint (blob) when enable_private_endpoints
