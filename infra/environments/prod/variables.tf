# infra/environments/prod/variables.tf

variable "location" {
  description = "Azure region for the prod environment."
  type        = string
  default     = "eastus2"
}

variable "enable_private_endpoints" {
  description = "Prod enables full private networking."
  type        = bool
  default     = true
}

variable "alert_email" {
  description = "Email for monitoring action group."
  type        = string
  default     = "coreyacampbell315@gmail.com"
}
