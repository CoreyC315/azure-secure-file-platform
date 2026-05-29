# modules/monitoring/variables.tf

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

variable "alert_email" {
  description = "Email address for the action group."
  type        = string
  default     = "coreyacampbell315@gmail.com"
}
