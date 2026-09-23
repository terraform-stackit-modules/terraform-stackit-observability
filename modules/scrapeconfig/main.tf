resource "stackit_observability_scrapeconfig" "this" {
  for_each = var.scrape_configs

  project_id      = var.project_id
  instance_id     = var.instance_id
  name            = each.value.name
  metrics_path    = each.value.metrics_path
  scheme          = each.value.scheme
  scrape_interval = each.value.scrape_interval
  scrape_timeout  = each.value.scrape_timeout
  sample_limit    = each.value.sample_limit

  targets = each.value.targets
}
