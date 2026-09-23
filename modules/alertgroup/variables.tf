variable "project_id" {
  description = "STACKIT project ID to which the alert group is associated."
  type        = string
}

variable "instance_id" {
  description = "The Observability instance ID the alert groups belong to."
  type        = string
}

variable "alert_groups" {
  description = <<-EOT
    Map of alert groups to create, keyed by a stable identifier. Each value:
      - `name`     (required) : the alert group name (unique per instance).
      - `interval`            : evaluation frequency (>= 60s), e.g. "60s". Default 60s.
      - `rules`    (required) : list of rules. Each rule:
          - `expression` (required) : PromQL expression.
          - `alert`                 : alert rule name (for alerting rules).
          - `record`                : metric name (for recording rules).
          - `for`                   : duration before firing, e.g. "60s".
          - `labels`                : map of labels.
          - `annotations`           : map of annotations.
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
