/**
 * Usage:
 *
 * ```hcl
 *
 * module "github_repo" {
 *   source           = "git::https://github.com/devops-adeel/terraform-gh-module.git?ref=v0.5.0"
 *   application_name = "foo"
 *   tfc_token        = vault_terraform_cloud_secret_creds.default.token
 *   template_type    = "module"
 *   repo_visibility  = "public"
 * }
 * ```
 */

locals {
  branch        = "main"
  application   = var.application_name
  visibility    = var.repo_visibility
  token         = var.tfc_token
  template_type = var.template_type
  template_file = {
    customer = "terraform/provider.tf"
    module   = "integration_tests/fixtures/provider.tf"
  }
}

resource "github_repository" "default" {
  name                   = local.application
  description            = "Repository to prep services for ${local.application}"
  visibility             = local.visibility
  has_issues             = true
  delete_branch_on_merge = true

  template {
    owner      = "devops-adeel"
    repository = "template-${local.template_type}-repo"
  } #NOTE: As part of the template, a branch called 'main' is created.
}

resource "github_branch_default" "default" {
  repository = github_repository.default.name
  branch     = local.branch
}

resource "github_actions_secret" "default" {
  repository      = github_repository.default.name
  secret_name     = "TFE_TOKEN"
  plaintext_value = local.token
}

resource "github_repository_file" "default" {
  repository          = github_repository.default.name
  branch              = local.branch
  file                = lookup(local.template_file, local.template_type)
  commit_message      = "Rendered provider configuration"
  commit_author       = "tfc_run"
  commit_email        = "team-is@hashicorp.com"
  content             = templatefile("${path.module}/provider.tpl", { application = local.application })
  overwrite_on_create = true

  lifecycle {
    ignore_changes = [
      content,
    ]
  }
}
