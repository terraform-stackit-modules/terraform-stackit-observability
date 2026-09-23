#####################################################################################
# Terraform module examples are meant to show an _example_ on how to use a module
# per use-case. The code below should not be copied directly but referenced in order
# to build your own root module that invokes this module.
#
# This example is self-contained and requires only `project_id`: it creates an
# Observability instance with a credential, a scrape config and an alert group.
#####################################################################################

module "observability" {
  source = "../.."

  project_id = var.project_id
  name       = "example-observability"
  plan_name  = var.plan_name
  acl        = ["0.0.0.0/0"]

  credentials = {
    default = {
      description = "Example credential"
    }
  }

  scrape_configs = {
    app = {
      name         = "example-app"
      metrics_path = "/metrics"
      targets = [
        {
          urls   = ["app.example.com:9100"]
          labels = { env = "dev" }
        }
      ]
    }
  }

  alert_groups = {
    node = {
      name     = "example-node-alerts"
      interval = "60s"
      rules = [
        {
          alert      = "ExampleNodeNotReady"
          expression = "kube_node_status_condition{condition=\"Ready\", status=\"false\"} > 0"
          for        = "60s"
          labels     = { severity = "critical" }
          annotations = {
            summary = "A node is not ready"
          }
        }
      ]
    }
  }
}
