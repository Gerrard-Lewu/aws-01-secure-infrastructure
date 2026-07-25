output "archive_bucket_name" {
  value = aws_s3_bucket.archive.bucket
}

output "public_access_block" {
  description = "Archive bucket public-access block settings. Used by the local security test suite."
  value       = aws_s3_bucket_public_access_block.archive
}

output "versioning_status" {
  description = "Archive bucket versioning status. Used by the local security test suite."
  value       = aws_s3_bucket_versioning.archive.versioning_configuration[0].status
}

output "encryption_algorithm" {
  description = "Archive bucket default encryption algorithm. Used by the local security test suite."
  value       = one(one(aws_s3_bucket_server_side_encryption_configuration.archive.rule).apply_server_side_encryption_by_default).sse_algorithm
}

output "object_ownership" {
  description = "Archive bucket object ownership setting. Used by the local security test suite."
  value       = one(aws_s3_bucket_ownership_controls.archive.rule).object_ownership
}
