variable "aws_region" {
  description = "AWS region used for project infrastructure."
  type        = string
}

variable "environment" {
  description = "Deployment environment identifier, such as dev or staging."
  type        = string
  default     = "dev"

  validation {
    condition     = can(regex("^[a-z0-9-]+$", var.environment))
    error_message = "Environment may contain only lowercase letters, numbers, and hyphens."
  }
}

variable "project_name" {
  description = "Short project identifier used in resource tags and names."
  type        = string
  default     = "aws-01-secure-infrastructure"
}
