# ─── Core ─────────────────────────────────────────────────────────────────────

variable "project_id" {
  description = "STACKIT project ID to which the Observability instance and its children are associated."
  type        = string
}

# ─── Instance ─────────────────────────────────────────────────────────────────

variable "create_instance" {
  description = "Whether to create the Observability instance. Set to false to manage children against an existing instance provided via `instance_id`."
  type        = bool
  default     = true
}

variable "instance_id" {
  description = "ID of an existing Observability instance. Used for children when `create_instance` is false."
  type        = string
  default     = null
}

variable "name" {
  description = "The name of the Observability instance."
  type        = string
  default     = null
}

variable "plan_name" {
  description = "The Observability plan name, e.g. \"Observability-Starter-EU01\"."
  type        = string
  default     = null
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

# ─── Credentials ──────────────────────────────────────────────────────────────

variable "credentials" {
  description = <<-EOT
    Map of credentials to create on the instance, keyed by a stable identifier. Each value:
      - `description`         : optional description.
      - `rotate_when_changed` : optional map whose change forces rotation.
    Generated passwords are exposed via the `credential_passwords` output (sensitive).
  EOT
  type = map(object({
    description         = optional(string)
    rotate_when_changed = optional(map(string))
  }))
  default = {}
}

# ─── Scrape configs ───────────────────────────────────────────────────────────

variable "scrape_configs" {
  description = <<-EOT
    Map of scrape jobs, keyed by a stable identifier. Each value:
      - `name`, `metrics_path`, `targets` ([{urls, labels?}]) are required.
      - `scheme`, `scrape_interval`, `scrape_timeout`, `sample_limit` are optional.
  EOT
  type = map(object({
    name         = string
    metrics_path = string
    targets = list(object({
      urls   = list(string)
      labels = optional(map(string))
    }))
    scheme          = optional(string)
    scrape_interval = optional(string)
    scrape_timeout  = optional(string)
    sample_limit    = optional(number)
  }))
  default = {}
}

# ─── Alert groups ─────────────────────────────────────────────────────────────

variable "alert_groups" {
  description = <<-EOT
    Map of alert groups, keyed by a stable identifier. Each value:
      - `name` (required), `interval` (>= 60s, default 60s).
      - `rules` (required): list of `{expression, alert?, record?, for?, labels?, annotations?}`.
  EOT
  type = map(object({
    name     = string
    interval = optional(string)
    rules = list(object({
      expression  = string
      alert       = optional(string)
      record      = optional(string)
      for         = optional(string)
      labels      = optional(map(string))
      annotations = optional(map(string))
    }))
  }))
  default = {}
}
