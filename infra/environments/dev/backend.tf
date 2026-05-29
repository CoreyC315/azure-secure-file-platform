# infra/environments/dev/backend.tf
# Remote state for the dev environment, stored in the Storage Account created by
# infra/bootstrap. Fill these in from the bootstrap outputs, then `terraform init`.
#
# Keeping state remote + locked is what makes the environment team-safe and
# reproducible (Reliability pillar).

terraform {
  backend "azurerm" {
    # TODO(milestone 2): set from bootstrap outputs
    # resource_group_name  = "asfp-tfstate-rg"
    # storage_account_name = "asfptfstate<suffix>"
    # container_name       = "tfstate"
    key = "dev.terraform.tfstate"
  }
}
