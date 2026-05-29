# infra/environments/prod/backend.tf
# Remote state for prod — same Storage Account as dev, different state key.

terraform {
  backend "azurerm" {
    # TODO(milestone 5): set from bootstrap outputs
    # resource_group_name  = "asfp-tfstate-rg"
    # storage_account_name = "asfptfstate<suffix>"
    # container_name       = "tfstate"
    key = "prod.terraform.tfstate"
  }
}
