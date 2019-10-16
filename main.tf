
provider "tfe" {
  hostname = "${var.tfe_host}"
  token    = "${var.token}"
}


data "tfe_workspace_ids" "all" {
  names        = ["*"]
  organization = "kcorbin"
}

# Iterate over all workspaces in the org and install webhook
resource "tfe_notification_configuration" "webhook" {
  for_each         = data.tfe_workspace_ids.all.external_ids
  name             = "${var.name}"
  enabled          = true
  destination_type = "generic"
  triggers = [
    "run:created",
    "run:planning",
    "run:needs_attention",
    "run:applying",
    "run:completed",
    "run:errored"
  ]
  url                   = "${var.webhook_url}"
  workspace_external_id = each.value
}
