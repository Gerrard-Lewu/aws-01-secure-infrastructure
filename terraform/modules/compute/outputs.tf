output "instance_id" {
  value = aws_instance.workload.id
}

output "security_group_id" {
  value = aws_security_group.workload.id
}
