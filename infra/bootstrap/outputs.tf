# infra/bootstrap/outputs.tf
# Values you copy OUT after bootstrap: into each env's backend.tf and GitHub repo variables.

# TODO(milestone 1): expose these once resources exist
# output "tfstate_storage_account_name" { value = azurerm_storage_account.state.name }
# output "tfstate_container_name"        { value = azurerm_storage_container.tfstate.name }
# output "tfstate_resource_group_name"   { value = azurerm_resource_group.state.name }
# output "ci_client_id"                  { value = azuread_application.ci.client_id }
# output "tenant_id"                     { value = data.azurerm_client_config.current.tenant_id }
# output "subscription_id"               { value = data.azurerm_client_config.current.subscription_id }
