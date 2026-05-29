# infra/bootstrap/variables.tf
# Inputs for the one-time bootstrap. Keep minimal — bootstrap should be near-zero-config.

variable "location" {
  description = "Azure region for the shared state resources."
  type        = string
  default     = "eastus2"
}

variable "github_repository" {
  description = "owner/repo that the OIDC federated credential will trust."
  type        = string
  default     = "CoreyC315/azure-secure-file-platform"
}

# TODO(milestone 1): add naming prefix, subscription_id, branch/environment subject vars
