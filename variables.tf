variable "application_name" {
  description = "Name of the application/customer"
  type        = string
}

variable "tfc_token" {
  description = "The TFC Token required to run tf plan/apply from the pipeline."
  type        = string
}

variable "tfc_workspace" {
  description = "TFC workspace dedicated for this repo"
  type        = string
  default     = "changeme"
}

variable "template_type" {
  description = "Template type determines which GH template to use, currently supported: [`module`, `customer`]"
  type        = string
  default     = "module"
}

variable "vault_namespace" {
  description = "Vault namespace to add as TFC variable"
  type = string
}

variable "repo_visibility" {
  description = "Whether to allow the repo to be public, defaults to private."
  type = string
  default = "private"
}
