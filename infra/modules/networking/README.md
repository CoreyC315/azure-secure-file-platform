# Module: networking

Provisions the VNet, subnets, NSGs, and (in prod) private DNS zones that the rest of the
platform attaches to.

**Provides:** `vnet_id`, `functions_subnet_id`, `private_endpoints_subnet_id`, DNS zone IDs.

```hcl
module "networking" {
  source                   = "../../modules/networking"
  name_prefix              = local.name_prefix
  location                 = var.location
  tags                     = local.tags
  enable_private_endpoints = var.enable_private_endpoints
}
```
