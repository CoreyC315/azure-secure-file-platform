# Module: monitoring

Log Analytics + workspace-based Application Insights + action group + a starter alert. The
function app wires its `APPLICATIONINSIGHTS_CONNECTION_STRING` to the output here.

**Provides:** `log_analytics_workspace_id`, `app_insights_connection_string` (sensitive).

```hcl
module "monitoring" {
  source      = "../../modules/monitoring"
  name_prefix = local.name_prefix
  location    = var.location
  tags        = local.tags
  alert_email = var.alert_email
}
```
