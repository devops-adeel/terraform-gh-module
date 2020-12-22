output "github_https_clone_url" {
  description = "The HTTPs URL of the newly created GitHub Repo"
  value       = github_repository.default.http_clone_url
}

output "github_git_clone_url" {
  description = "The git URL of the newly created GitHub Repo"
  value       = github_repository.default.git_clone_url
}

output "github_ssh_clone_url" {
  description = "The SSH URL of the newly created GitHub Repo"
  value       = github_repository.default.ssh_clone_url
}

output "github_repo_url" {
  description = "The Web URL of the newly created GitHub Repo"
  value       = github_repository.default.html_url
}

output "repo_name" {
  description = "A string of the form: orgname/reponame"
  value       = github_repository.default.full_name
}
