output "instance_id" {
  value = aws_instance.workload.id
}

output "security_group_id" {
  value = aws_security_group.workload.id
}

output "public_ip_assignment" {
  description = "Whether the workload receives a public IP address. Used by the local security test suite."
  value       = aws_instance.workload.associate_public_ip_address
}

output "imds_tokens" {
  description = "IMDS token requirement for the workload. Used by the local security test suite."
  value       = aws_instance.workload.metadata_options[0].http_tokens
}

output "root_volume_encrypted" {
  description = "Whether the workload root volume is encrypted. Used by the local security test suite."
  value       = aws_instance.workload.root_block_device[0].encrypted
}

output "security_group_ingress" {
  description = "Configured workload security-group ingress rules. Used by the local security test suite."
  value       = aws_security_group.workload.ingress
}

output "security_group_egress" {
  description = "Configured workload security-group egress rules. Used by the local security test suite."
  value       = aws_security_group.workload.egress
}
