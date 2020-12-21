variable "application_name" {
  description = "Name of the application/customer"
  type        = string
}

variable "tfc_token" {
  description = "The TFC Token required to run tf plan/apply from the pipeline."
  type        = string
}
