# Validation Guide

## Local configuration checks

Run from the repository root:

```powershell
.\scripts\validate.ps1
```

The command checks formatting and validates both the remote-state bootstrap and the main Terraform configuration. It does not create AWS resources.

## Bootstrap plan review

```powershell
Set-Location terraform/bootstrap
terraform plan -out bootstrap.tfplan
terraform show bootstrap.tfplan
```

Confirm that the plan creates only the dedicated state bucket and its security controls: public-access block, versioning, AES-256 encryption, ownership controls, and the 90-day noncurrent-version lifecycle rule.

## Main infrastructure plan review

After the state bucket exists and `backend.hcl` has been copied locally:

```powershell
Set-Location terraform
terraform init -backend-config=backend.hcl
terraform plan -out core.tfplan
terraform show core.tfplan
```

Confirm the VPC and four subnets use the documented CIDR ranges, only one NAT Gateway is planned, the EC2 instance has no public IP, and the workload security group contains no inbound rule.

## Post-apply checks

- Confirm the EC2 instance appears as a managed node in AWS Systems Manager.
- Confirm the private EC2 instance has no public IPv4 address.
- Confirm the public route table points to the Internet Gateway.
- Confirm the private route table points to the NAT Gateway.
- Capture sanitised evidence in `docs/evidence`.
