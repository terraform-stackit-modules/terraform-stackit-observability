variable "project_id" {
  description = "STACKIT project ID to which the scraping job is associated."
  type        = string
}

variable "instance_id" {
  description = "The Observability instance ID the scrape configs belong to."
  type        = string
}

variable "scrape_configs" {
  description = <<-EOT
    Map of scrape jobs to create, keyed by a stable identifier. Each value:
      - `name`         (required) : the scraping job name.
      - `metrics_path` (required) : the scrape URL path, e.g. "/metrics".
      - `targets`      (required) : list of `{ urls = [<url>...], labels = { k = v } }`.
      - `scheme`                  : "http" or "https" (default https).
      - `scrape_interval`         : duration string (default "5m").
      - `scrape_timeout`          : duration string (default "2m").
      - `sample_limit`            : scrape sample limit (default 5000).
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
