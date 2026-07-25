output "vpc_id" {
  description = "ID of the project VPC."
  value       = module.network.vpc_id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets, in Availability Zone order."
  value       = module.network.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs of the private subnets, in Availability Zone order."
  value       = module.network.private_subnet_ids
}

output "workload_security_group_id" {
  description = "Security group ID assigned to the private workload."
  value       = module.compute.security_group_id
}

output "workload_instance_id" {
  description = "ID of the SSM-managed private EC2 workload."
  value       = module.compute.instance_id
}

output "archive_bucket_name" {
  description = "Name of the encrypted archive bucket for future project phases."
  value       = module.storage.archive_bucket_name
}
