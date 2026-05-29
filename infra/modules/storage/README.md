# Module: storage

Ingestion storage: the account + `landing` container that triggers the pipeline, wired to
Event Grid. Identity-only access (no account keys), private endpoint in prod.

**Provides:** `storage_account_id`, `storage_account_name`, `landing_container`.

```hcl
module "storage" {
  source                     = "../../modules/storage"
  name_prefix                = local.name_prefix
  location                   = var.location
  tags                       = local.tags
  enable_private_endpoints   = var.enable_private_endpoints
  private_endpoint_subnet_id = module.networking.private_endpoints_subnet_id
}
```
