resource "github_repository" "default" {
  name                   = var.application_name
  description            = "Repository to prep services for ${var.application_name}"
  visibility             = "private"
  has_issues             = true
  delete_branch_on_merge = true
  gitignore_template     = "Terraform"

  template {
    owner      = "devops-adeel"
    repository = "template-customer-repo"
  }
}

resource "github_branch" "default" {
  repository = github_repository.default.name
  branch     = "main"
}

resource "github_branch_default" "default" {
  repository = github_repository.default.name
  branch     = github_branch.default.branch
}

resource "github_branch_protection" "default" {
  repository_id  = github_repository.default.node_id
  pattern        = "main"
  enforce_admins = true
}

resource "github_actions_secret" "default" {
  repository      = github_repository.default.name
  secret_name     = "tfc_token"
  plaintext_value = var.tfc_token
}
