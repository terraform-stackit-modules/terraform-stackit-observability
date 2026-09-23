output "instance_id" {
  description = "The Observability instance ID (created, or the provided instance_id when create_instance is false)."
  value       = coalesce(module.instance.instance_id, var.instance_id)
}

output "grafana_url" {
  description = "The Grafana URL of the instance."
  value       = module.instance.grafana_url
}

output "metrics_push_url" {
  description = "The metrics push URL."
  value       = module.instance.metrics_push_url
}

output "logs_push_url" {
  description = "The logs push URL."
  value       = module.instance.logs_push_url
}

output "dashboard_url" {
  description = "The instance dashboard URL."
  value       = module.instance.dashboard_url
}

output "credential_usernames" {
  description = "Map of credential key to username."
  value       = module.credential.usernames
}

output "credential_passwords" {
  description = "Map of credential key to password. Sensitive."
  value       = module.credential.passwords
  sensitive   = true
}

output "scrape_config_names" {
  description = "Map of scrape config key to name."
  value       = module.scrapeconfig.scrape_config_names
}

output "alert_group_names" {
  description = "Map of alert group key to name."
  value       = module.alertgroup.alert_group_names
}
