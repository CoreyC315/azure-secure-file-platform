# modules/keyvault/variables.tf

variable "name_prefix" {
  description = "Naming prefix."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
}

variable "tags" {
  description = "Common resource tags."
  type        = map(string)
  default     = {}
}

variable "function_principal_id" {
  description = "Managed identity principal ID granted Secrets User."
  type        = string
  default     = null
}

variable "enable_private_endpoints" {
  description = "Create a Key Vault private endpoint (prod profile)."
  type        = bool
  default     = false
}

variable "private_endpoint_subnet_id" {
  description = "Subnet for the Key Vault private endpoint."
  type        = string
  default     = null
}
