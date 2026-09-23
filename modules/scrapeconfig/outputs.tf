output "scrape_config_names" {
  description = "Map of scrape config key to its name."
  value       = { for k, s in stackit_observability_scrapeconfig.this : k => s.name }
}
