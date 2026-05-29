# modules/networking/variables.tf — inputs for the network module.

variable "name_prefix" {
  description = "Naming prefix, e.g. asfp-dev."
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

variable "vnet_address_space" {
  description = "VNet CIDR(s)."
  type        = list(string)
  default     = ["10.20.0.0/16"]
}

variable "enable_private_endpoints" {
  description = "When true, create private DNS zones (prod profile). Dev can leave false."
  type        = bool
  default     = false
}

# TODO(milestone 2): per-subnet CIDR variables
