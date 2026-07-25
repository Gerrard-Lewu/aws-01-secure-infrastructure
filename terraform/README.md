# Main Terraform Configuration

This directory composes network, IAM, compute, and storage modules for the dev
environment. It provisions two public subnets, two private subnets, one NAT
Gateway, a Systems Manager-managed private EC2 instance, and encrypted archive
storage.

Initialise with `terraform init -backend-config=backend.hcl` after completing
the S3 bootstrap process documented in `../docs/manual-setup.md`.
