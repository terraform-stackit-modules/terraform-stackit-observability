resource "stackit_observability_alertgroup" "this" {
  for_each = var.alert_groups

  project_id  = var.project_id
  instance_id = var.instance_id
  name        = each.value.name
  interval    = each.value.interval

  rules = each.value.rules
}
