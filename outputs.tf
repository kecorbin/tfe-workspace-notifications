output "workspaces" {
  value = data.tfe_workspace_ids.all.external_ids
}
