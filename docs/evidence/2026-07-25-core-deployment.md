# Core Infrastructure Deployment Evidence

- **Date:** 2026-07-25
- **Environment:** dev
- **Region:** af-south-1
- **Result:** Successful deployment and validation

## Deployment summary

- Remote state bootstrap: 6 resources created.
- Core infrastructure: 26 resources created.
- Terraform post-apply plan: no changes required.

## Validated controls

- The workload instance is running in a private subnet without a public IP address.
- IMDSv2 is required on the workload instance.
- The workload security group has no inbound rules and permits HTTPS egress only.
- The public route table uses the Internet Gateway; the private route table uses the NAT Gateway.
- The NAT Gateway is available.
- AWS Systems Manager reports the Amazon Linux instance as online.
- The remote-state and archive buckets block public access, enforce bucket ownership, use AES-256 encryption, and have versioning enabled.

## Evidence handling

Resource IDs, account-specific identifiers, credentials, and private IP addresses are intentionally excluded from this record.
