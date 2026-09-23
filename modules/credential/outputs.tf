output "usernames" {
  description = "Map of credential key to username."
  value       = { for k, c in stackit_observability_credential.this : k => c.username }
}

output "passwords" {
  description = "Map of credential key to password. Sensitive."
  value       = { for k, c in stackit_observability_credential.this : k => c.password }
  sensitive   = true
}
