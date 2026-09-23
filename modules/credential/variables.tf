variable "project_id" {
  description = "STACKIT project ID to which the instance is associated."
  type        = string
}

variable "instance_id" {
  description = "The Observability instance ID the credentials belong to."
  type        = string
}

variable "credentials" {
  description = <<-EOT
    Map of credentials to create on the instance, keyed by a stable identifier. Each value:
      - `description`         : optional description of the credential.
      - `rotate_when_changed` : optional map whose change forces rotation.
    Generated username/password are exposed via outputs (password sensitive).
  EOT
  type = map(object({
    description         = optional(string)
    rotate_when_changed = optional(map(string))
  }))
  default = {}
}
