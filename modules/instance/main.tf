resource "stackit_observability_instance" "this" {
  count = var.create_instance ? 1 : 0

  project_id = var.project_id
  name       = var.name
  plan_name  = var.plan_name
  acl        = var.acl

  logs_retention_days                    = var.logs_retention_days
  traces_retention_days                  = var.traces_retention_days
  metrics_retention_days                 = var.metrics_retention_days
  metrics_retention_days_5m_downsampling = var.metrics_retention_days_5m_downsampling
  metrics_retention_days_1h_downsampling = var.metrics_retention_days_1h_downsampling
}
