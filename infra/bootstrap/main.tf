# =============================================================================
# infra/bootstrap/main.tf
# ONE-TIME bootstrap, run with LOCAL state before anything else exists.
# Provisions the two foundations the rest of the project depends on:
#   1. Terraform remote-state backend  -> Storage Account + container (versioned)
#   2. CI identity (zero-secret)        -> Entra ID app registration + service
#                                          principal + GitHub OIDC federated credential
# After `terraform apply` here, copy the outputs into the env backend.tf and into
# GitHub repo variables, then never run this again unless rotating identity.
# =============================================================================

terraform {
  required_version = ">= 1.7"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.20"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 3.0"
    }
  }
  # NOTE: bootstrap intentionally uses LOCAL state (chicken-and-egg: it creates
  # the very backend that everything else uses).
}

provider "azurerm" {
  features {}
}

provider "azuread" {}

# TODO(milestone 1): resource group for shared state
# resource "azurerm_resource_group" "state" { ... }

# TODO(milestone 1): storage account + container for Terraform remote state
#   - enable blob versioning, disable public access, TLS1.2 min
# resource "azurerm_storage_account" "state" { ... }
# resource "azurerm_storage_container" "tfstate" { ... }

# TODO(milestone 1): Entra ID app + SP for GitHub Actions OIDC
# resource "azuread_application" "ci" { ... }
# resource "azuread_service_principal" "ci" { ... }

# TODO(milestone 1): federated credential scoped to this GitHub repo/branch
#   subject e.g. repo:CoreyC315/azure-secure-file-platform:ref:refs/heads/main
# resource "azuread_application_federated_identity_credential" "gh" { ... }

# TODO(milestone 1): role assignments for the CI SP
#   - Contributor + User Access Administrator at subscription scope
# resource "azurerm_role_assignment" "ci_contributor" { ... }
