# =============================================================================
# modules/networking — the private network fabric everything else plugs into.
# Provisions: VNet, subnets (one delegated to the Function App, one for private
# endpoints), NSGs, and the private DNS zones used by storage/keyvault/cosmos
# private endpoints. Reused identically by dev and prod (behaviour differs only
# by the CIDRs/flags passed in).
# =============================================================================

# TODO(milestone 2): azurerm_virtual_network
# TODO(milestone 2): azurerm_subnet "functions" (delegated to Microsoft.App/environments or Web/serverFarms)
# TODO(milestone 2): azurerm_subnet "private_endpoints"
# TODO(milestone 2): azurerm_network_security_group + associations
# TODO(milestone 5): azurerm_private_dns_zone for blob / vault / documents + vnet links
