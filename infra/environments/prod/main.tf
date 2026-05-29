# infra/environments/prod/main.tf
# PROD composition — identical module wiring to dev but with the SECURITY profile
# (enable_private_endpoints = true -> private endpoints + private DNS + tighter NSGs).
# This sameness-with-one-flag is the point: reusable modules, environment parity.

locals {
  name_prefix = "asfp-prod"
  tags = {
    env           = "prod"
    project       = "azure-secure-file-platform"
    owner         = "CoreyC315"
    "cost-center" = "portfolio"
  }
}

# TODO(milestone 5): resource group + same module wiring as dev/main.tf,
# passing enable_private_endpoints = true and the private-endpoint subnet ids.
