output "alert_group_names" {
  description = "Map of alert group key to its name."
  value       = { for k, a in stackit_observability_alertgroup.this : k => a.name }
}
