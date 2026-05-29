# modules/cosmos/variables.tf

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

variable "enable_private_endpoints" {
  description = "Create a Cosmos private endpoint (prod profile)."
  type        = bool
  default     = false
}

variable "private_endpoint_subnet_id" {
  description = "Subnet for the Cosmos private endpoint."
  type        = string
  default     = null
}

# TODO(milestone 3): database/container names, partition key path
