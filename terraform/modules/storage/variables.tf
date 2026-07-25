variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "archive_bucket_name" {
  type = string
}

variable "common_tags" {
  type = map(string)
}
