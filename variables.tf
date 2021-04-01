variable "application_name" {
  description = "Name of the application/customer"
  type        = string
}

variable "tfc_token" {
  description = "The TFC Token required to run tf plan/apply from the pipeline."
  type        = string
  sensitive   = true
}

variable "template_type" {
  description = "Template type determines which GH template to use, currently supported: [`module`, `customer`]"
  type        = string
  default     = "module"
}

variable "repo_visibility" {
  description = "Whether to allow the repo to be public, defaults to private."
  type        = string
  default     = "private"
}
