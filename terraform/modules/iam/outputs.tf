output "instance_profile_name" {
  value = aws_iam_instance_profile.workload.name
}

output "ssm_policy_arn" {
  description = "Systems Manager managed policy attached to the workload role. Used by the local security test suite."
  value       = aws_iam_role_policy_attachment.ssm_managed_instance.policy_arn
}
