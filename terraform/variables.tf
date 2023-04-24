variable "project_id" {
  description = "ID for the project to be created"
  type        = string
  nullable    = false
}

variable "project_name" {
  description = "Name for the project to be created"
  type        = string
  nullable    = false
}

variable "billing_account" {
  description = "Billing account for the new project"
  type        = string
  nullable    = false
}

variable "region" {
  description = "Region for the buckets"
  type        = string
  nullable    = false
}
