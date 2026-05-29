# infra/environments/dev/providers.tf
# Pins the providers for the dev environment. azurerm v4.20+ is required for the
# native azurerm_function_app_flex_consumption resource.

terraform {
  required_version = ">= 1.7"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.20"
    }
  }
}

provider "azurerm" {
  features {}
  # subscription_id is taken from ARM_SUBSCRIPTION_ID / az login context.
}
