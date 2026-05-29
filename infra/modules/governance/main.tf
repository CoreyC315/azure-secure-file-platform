# =============================================================================
# modules/governance — guardrails.
# Assigns Azure Policy at the resource-group (or subscription) scope to enforce
# org standards: deny public blob access, require standard tags, restrict
# allowed locations. Demonstrates governance maturity beyond "it deploys".
# =============================================================================

# TODO(milestone 6): azurerm_resource_group_policy_assignment "deny_public_blob"
#   (built-in: "Storage accounts should restrict network access" / deny public blob)
# TODO(milestone 6): azurerm_policy_definition or built-in "Require a tag on resources"
#   for env / project / owner / cost-center
# TODO(milestone 6): azurerm_resource_group_policy_assignment "allowed_locations"
