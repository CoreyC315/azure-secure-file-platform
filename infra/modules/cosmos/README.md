# Module: cosmos

Serverless Cosmos DB (NoSQL) account, database, and container holding extracted file
metadata. Data-plane access is identity-based (local auth disabled); private endpoint in prod.

**Provides:** `cosmos_account_name`, `cosmos_endpoint`, `database_name`, `container_name`.

```hcl
module "cosmos" {
  source                   = "../../modules/cosmos"
  name_prefix              = local.name_prefix
  location                 = var.location
  tags                     = local.tags
  enable_private_endpoints = var.enable_private_endpoints
}
```
