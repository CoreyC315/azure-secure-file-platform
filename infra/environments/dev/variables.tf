# infra/environments/dev/variables.tf

variable "location" {
  description = "Azure region for the dev environment."
  type        = string
  default     = "eastus2"
}

variable "enable_private_endpoints" {
  description = "Dev keeps this false for cost; prod sets true for full private networking."
  type        = bool
  default     = false
}

variable "alert_email" {
  description = "Email for monitoring action group."
  type        = string
  default     = "coreyacampbell315@gmail.com"
}
