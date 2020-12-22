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
