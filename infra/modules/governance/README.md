# Module: governance

Azure Policy assignments enforcing platform guardrails: deny public blob access, require
standard tags, restrict allowed locations. Assigned at the environment's resource-group scope.

**Provides:** `policy_assignment_ids`.

```hcl
module "governance" {
  source            = "../../modules/governance"
  scope_id          = azurerm_resource_group.env.id
  allowed_locations = [var.location]
}
```

Test by attempting to create an untagged resource — the assignment should deny it.
