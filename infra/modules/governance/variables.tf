# modules/governance/variables.tf

variable "scope_id" {
  description = "Resource group (or subscription) ID the policies assign to."
  type        = string
}

variable "allowed_locations" {
  description = "Regions resources may be created in."
  type        = list(string)
  default     = ["eastus2"]
}

variable "required_tags" {
  description = "Tag keys that must be present on resources."
  type        = list(string)
  default     = ["env", "project", "owner", "cost-center"]
}
