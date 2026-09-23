module "instance" {
  source = "./modules/instance"

  create_instance = var.create_instance
  project_id      = var.project_id
  name            = var.name
  plan_name       = var.plan_name
  acl             = var.acl

  logs_retention_days                    = var.logs_retention_days
  traces_retention_days                  = var.traces_retention_days
  metrics_retention_days                 = var.metrics_retention_days
  metrics_retention_days_5m_downsampling = var.metrics_retention_days_5m_downsampling
  metrics_retention_days_1h_downsampling = var.metrics_retention_days_1h_downsampling
}

module "credential" {
  source = "./modules/credential"

  project_id  = var.project_id
  instance_id = coalesce(module.instance.instance_id, var.instance_id)
  credentials = var.credentials
}

module "scrapeconfig" {
  source = "./modules/scrapeconfig"

  project_id     = var.project_id
  instance_id    = coalesce(module.instance.instance_id, var.instance_id)
  scrape_configs = var.scrape_configs
}

module "alertgroup" {
  source = "./modules/alertgroup"

  project_id   = var.project_id
  instance_id  = coalesce(module.instance.instance_id, var.instance_id)
  alert_groups = var.alert_groups
}
