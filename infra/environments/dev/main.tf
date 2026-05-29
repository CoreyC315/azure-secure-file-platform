# infra/environments/dev/main.tf
# DEV composition — wires the reusable modules together with the cheaper profile
# (enable_private_endpoints = false -> service endpoints, no always-on cost).
# The environment files are intentionally THIN: all real logic lives in modules.

locals {
  name_prefix = "asfp-dev"
  tags = {
    env           = "dev"
    project       = "azure-secure-file-platform"
    owner         = "CoreyC315"
    "cost-center" = "portfolio"
  }
}

# TODO(milestone 2): resource group for the env
# resource "azurerm_resource_group" "env" {
#   name     = "${local.name_prefix}-rg"
#   location = var.location
#   tags     = local.tags
# }

# --- module wiring (uncomment as each module is implemented) ---

# module "monitoring"   { source = "../../modules/monitoring"   ... }
# module "networking"   { source = "../../modules/networking"   ... }
# module "storage"      { source = "../../modules/storage"      ... }
# module "cosmos"       { source = "../../modules/cosmos"        ... }
# module "function_app" { source = "../../modules/function_app" ... }
# module "keyvault"     { source = "../../modules/keyvault"      ... }
# module "governance"   { source = "../../modules/governance"    ... }
