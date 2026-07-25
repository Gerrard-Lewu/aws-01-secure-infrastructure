# Deployment and Validation Evidence

Store concise, sanitised evidence that demonstrates the project works as
designed. Do not include account IDs, credentials, private IP addresses, or
Terraform state.

Suggested evidence for later phases:

- Terraform plan summary after the network implementation.
- AWS Console screenshot showing the EC2 instance has no public IP address.
- Security group rules with sensitive values redacted.
- S3 settings showing versioning, encryption, and blocked public access.
- Systems Manager session confirmation without exposing instance details.

Each item should state the date, environment, purpose, and validation result.
