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

variable "availability_zones" {
  description = "Two available AWS Availability Zones used by the VPC."
  type        = list(string)
  default     = ["af-south-1a", "af-south-1b"]

  validation {
    condition     = length(var.availability_zones) == 2
    error_message = "Exactly two Availability Zones are required for this design."
  }
}

variable "vpc_cidr" {
  description = "CIDR range reserved for the project VPC."
  type        = string
  default     = "10.20.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR ranges for the two public subnets."
  type        = list(string)
  default     = ["10.20.0.0/24", "10.20.1.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDR ranges for the two private workload subnets."
  type        = list(string)
  default     = ["10.20.10.0/24", "10.20.11.0/24"]
}

variable "instance_type" {
  description = "EC2 instance type for the private workload."
  type        = string
  default     = "t3.micro"
}

variable "archive_bucket_name" {
  description = "Globally unique S3 bucket name for future backup and diagnostic archives."
  type        = string
  default     = "gerrard-lewu-322513863494-aws01-dev-archive"
}
