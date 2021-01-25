## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| `github` | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| `application_name` | Name of the application/customer | `string` | n/a | yes |
| `tfc_token` | The TFC Token required to run tf plan/apply from the pipeline. | `string` | n/a | yes |
| `template_type` | Template type determines which GH template to use, currently supported: [`module`, `customer`] | `string` | n/a | yes |
| `vault_namespace` | Vault namespace to add as TFC variable | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| `github_git_clone_url` | The git URL of the newly created GitHub Repo |
| `github_https_clone_url` | The HTTPs URL of the newly created GitHub Repo |
| `github_repo_url` | The Web URL of the newly created GitHub Repo |
| `github_ssh_clone_url` | The SSH URL of the newly created GitHub Repo |
| `repo_name` | A string of the form: orgname/reponame |
