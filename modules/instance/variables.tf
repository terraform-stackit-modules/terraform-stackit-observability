variable "project_id" {
  description = "STACKIT project ID to which the instance is associated."
  type        = string
}

variable "create_instance" {
  description = "Whether to create the Observability instance."
  type        = bool
  default     = true
}

variable "name" {
  description = "The name of the Observability instance."
  type        = string
}

variable "plan_name" {
  description = "The Observability plan name, e.g. \"Observability-Starter-EU01\"."
  type        = string
}

variable "acl" {
  description = "Access control list: set of CIDR ranges permitted to access the instance."
  type        = set(string)
  default     = []
}

variable "logs_retention_days" {
  description = "How many days logs are kept (default 7)."
  type        = number
  default     = null
}

variable "traces_retention_days" {
  description = "How many days traces are kept (default 7)."
  type        = number
  default     = null
}

variable "metrics_retention_days" {
  description = "How many days raw metrics are kept (default 90)."
  type        = number
  default     = null
}

variable "metrics_retention_days_5m_downsampling" {
  description = "How many days 5m-downsampled metrics are kept (must be < general retention)."
  type        = number
  default     = null
}

variable "metrics_retention_days_1h_downsampling" {
  description = "How many days 1h-downsampled metrics are kept (must be < 5m-downsampling retention)."
  type        = number
  default     = null
}
