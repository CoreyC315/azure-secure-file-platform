# modules/function_app/variables.tf

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

variable "functions_subnet_id" {
  description = "Subnet for VNet integration."
  type        = string
  default     = null
}

variable "app_insights_connection_string" {
  description = "Application Insights connection string from the monitoring module."
  type        = string
  default     = null
  sensitive   = true
}

variable "instance_memory_mb" {
  description = "Flex Consumption instance memory size (MB): 512, 2048, or 4096."
  type        = number
  default     = 2048
}

# TODO(milestone 4): cosmos endpoint/db/container, landing storage account id
