resource "github_repository" "default" {
  name                   = var.application_name
  description            = "Repository to prep services for ${var.application_name}"
  visibility             = "private"
  has_issues             = true
  delete_branch_on_merge = true
  gitignore_template     = "Terraform"

  template {
    owner      = "devops-adeel"
    repository = "template-customer-repo" #NOTE: As part of the template, a branch called 'main' is created.
  }
}

#TODO: This needs to be enabled when repos are owned by Hashicorp
/* resource "github_branch_protection" "default" { */
/*   repository_id  = github_repository.default.node_id */
/*   pattern        = "main" */
/*   enforce_admins = true */
/* } */

resource "github_actions_secret" "default" {
  repository      = github_repository.default.name
  secret_name     = "tfc_token"
  plaintext_value = var.tfc_token
}

resource "github_repository_file" "default" {
  repository          = github_repository.default.name
  branch              = "main"
  file                = "provider.tf"
  commit_message      = "Rendered provider configuration"
  commit_author       = "tfc_run"
  commit_email        = "team-is@hashicorp.com"
  content             = templatefile("${path.module}/provider.tpl", { tfc_workspace = var.tfc_workspace })
  /* overwrite_on_create = true */
}
