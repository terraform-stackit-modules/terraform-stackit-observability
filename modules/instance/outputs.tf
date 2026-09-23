output "instance_id" {
  description = "The Observability instance ID (null when create_instance is false)."
  value       = var.create_instance ? stackit_observability_instance.this[0].instance_id : null
}

output "grafana_url" {
  description = "The Grafana URL of the instance (null when create_instance is false)."
  value       = var.create_instance ? stackit_observability_instance.this[0].grafana_url : null
}

output "metrics_push_url" {
  description = "The metrics push URL (null when create_instance is false)."
  value       = var.create_instance ? stackit_observability_instance.this[0].metrics_push_url : null
}

output "logs_push_url" {
  description = "The logs push URL (null when create_instance is false)."
  value       = var.create_instance ? stackit_observability_instance.this[0].logs_push_url : null
}

output "dashboard_url" {
  description = "The instance dashboard URL (null when create_instance is false)."
  value       = var.create_instance ? stackit_observability_instance.this[0].dashboard_url : null
}
