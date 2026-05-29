# Module: keyvault

RBAC-authorized Key Vault for app secrets/config. The Function App's managed identity gets
`Key Vault Secrets User`; no secrets in app settings or state. Private endpoint in prod.

**Provides:** `key_vault_id`, `key_vault_uri`.

```hcl
module "keyvault" {
  source                = "../../modules/keyvault"
  name_prefix           = local.name_prefix
  location              = var.location
  tags                  = local.tags
  function_principal_id = module.function_app.principal_id
}
```
