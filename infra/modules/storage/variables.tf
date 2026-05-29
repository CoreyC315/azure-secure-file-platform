# modules/storage/variables.tf

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
  description = "Create a blob private endpoint (prod profile)."
  type        = bool
  default     = false
}

variable "private_endpoint_subnet_id" {
  description = "Subnet for the blob private endpoint. Required when enable_private_endpoints."
  type        = string
  default     = null
}

# TODO(milestone 3): container name, retention, blob DNS zone id
