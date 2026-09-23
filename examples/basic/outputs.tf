output "instance_id" {
  description = "The Observability instance ID created by the example."
  value       = module.observability.instance_id
}

output "grafana_url" {
  description = "The Grafana URL of the instance."
  value       = module.observability.grafana_url
}
