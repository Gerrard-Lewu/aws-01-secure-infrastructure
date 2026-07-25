variable "aws_region" {
  description = "AWS region for the Terraform state bucket."
  type        = string
}

variable "state_bucket_name" {
  description = "Globally unique S3 bucket name for Terraform state."
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9][a-z0-9.-]{1,61}[a-z0-9]$", var.state_bucket_name))
    error_message = "State bucket name must be a valid S3 bucket name between 3 and 63 characters."
  }
}

variable "project_name" {
  description = "Project tag applied to the state bucket."
  type        = string
  default     = "aws-01-secure-infrastructure"
}
