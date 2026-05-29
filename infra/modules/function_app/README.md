# Module: function_app

Azure Functions **Flex Consumption** app (Python) with system-assigned managed identity, VNet
integration, App Insights wiring, and the RBAC assignments that let it reach Storage, Cosmos,
and Key Vault with no secrets.

**Provides:** `function_app_name`, `default_hostname`, `principal_id`.

> ⚠️ Uses identity-based `AzureWebJobsStorage__*` (not a connection string) — see
> `docs/runbook.md` for the Flex Consumption startup-lock gotcha.

```hcl
module "function_app" {
  source                         = "../../modules/function_app"
  name_prefix                    = local.name_prefix
  location                       = var.location
  tags                           = local.tags
  functions_subnet_id            = module.networking.functions_subnet_id
  app_insights_connection_string = module.monitoring.app_insights_connection_string
  instance_memory_mb             = 2048
}
```
