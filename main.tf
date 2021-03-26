locals {
  branch = "main"
  template_type = {
    customer = "terraform/provider.tf"
    module   = "integration_tests/fixtures/provider.tf"
  }
}

resource "github_repository" "default" {
  name                   = var.application_name
  description            = "Repository to prep services for ${var.application_name}"
  visibility             = var.repo_visibility
  has_issues             = true
  delete_branch_on_merge = true

  template {
    owner      = "devops-adeel"
    repository = "template-${var.template_type}-repo"
  } #NOTE: As part of the template, a branch called 'main' is created.
}

resource "github_branch_default" "default" {
  repository = github_repository.default.name
  branch     = local.branch
}

#TODO: This needs to be enabled when repos are owned by Hashicorp
/* resource "github_branch_protection" "default" { */
/*   repository_id  = github_repository.default.node_id */
/*   pattern        = local.branch */
/*   enforce_admins = true */
/* } */

resource "github_actions_secret" "default" {
  repository      = github_repository.default.name
  secret_name     = "TFE_TOKEN"
  plaintext_value = var.tfc_token
}

resource "github_repository_file" "default" {
  repository     = github_repository.default.name
  branch         = local.branch
  file           = lookup(local.template_type, var.template_type)
  commit_message = "Rendered provider configuration"
  commit_author  = "tfc_run"
  commit_email   = "team-is@hashicorp.com"
  content        = templatefile("${path.module}/provider.tpl", { tfc_workspace = var.tfc_workspace, vault_namespace = var.vault_namespace })
  overwrite_on_create = true
}
