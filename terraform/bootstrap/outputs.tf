output "state_bucket_name" {
  description = "Name of the created S3 bucket used by the main Terraform backend."
  value       = aws_s3_bucket.terraform_state.bucket
}

output "backend_configuration_hint" {
  description = "Values to place in the main configuration's local backend.hcl file."
  value = {
    bucket = aws_s3_bucket.terraform_state.bucket
    key    = "aws-01-secure-infrastructure/dev/terraform.tfstate"
    region = var.aws_region
  }
}
