variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "private_subnet_id" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "instance_profile" {
  type = string
}

variable "common_tags" {
  type = map(string)
}
