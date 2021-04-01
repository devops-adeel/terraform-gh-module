## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_actions_secret.default](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/actions_secret) | resource |
| [github_branch_default.default](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/branch_default) | resource |
| [github_repository.default](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/repository) | resource |
| [github_repository_file.default](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/repository_file) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_name"></a> [application\_name](#input\_application\_name) | Name of the application/customer | `string` | n/a | yes |
| <a name="input_repo_visibility"></a> [repo\_visibility](#input\_repo\_visibility) | Whether to allow the repo to be public, defaults to private. | `string` | `"private"` | no |
| <a name="input_template_type"></a> [template\_type](#input\_template\_type) | Template type determines which GH template to use, currently supported: [`module`, `customer`] | `string` | `"module"` | no |
| <a name="input_tfc_token"></a> [tfc\_token](#input\_tfc\_token) | The TFC Token required to run tf plan/apply from the pipeline. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_github_git_clone_url"></a> [github\_git\_clone\_url](#output\_github\_git\_clone\_url) | The git URL of the newly created GitHub Repo |
| <a name="output_github_https_clone_url"></a> [github\_https\_clone\_url](#output\_github\_https\_clone\_url) | The HTTPs URL of the newly created GitHub Repo |
| <a name="output_github_repo_url"></a> [github\_repo\_url](#output\_github\_repo\_url) | The Web URL of the newly created GitHub Repo |
| <a name="output_github_ssh_clone_url"></a> [github\_ssh\_clone\_url](#output\_github\_ssh\_clone\_url) | The SSH URL of the newly created GitHub Repo |
| <a name="output_repo_name"></a> [repo\_name](#output\_repo\_name) | A string of the form: orgname/reponame |
