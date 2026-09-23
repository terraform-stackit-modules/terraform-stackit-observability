resource "stackit_observability_credential" "this" {
  for_each = var.credentials

  project_id          = var.project_id
  instance_id         = var.instance_id
  description         = each.value.description
  rotate_when_changed = each.value.rotate_when_changed
}
