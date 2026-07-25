# Main Terraform Configuration

This directory will compose the network, IAM, compute, and storage modules as
the infrastructure implementation progresses. Phase 1 provides provider,
backend, variable, and output conventions only.

Initialise with `terraform init -backend-config=backend.hcl` after completing
the S3 bootstrap process documented in `../docs/manual-setup.md`.
