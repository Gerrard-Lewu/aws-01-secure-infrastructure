# Manual Setup and Deployment Guide

This guide reproduces the deployed Project 1 foundation in a different AWS
account. The committed examples contain placeholders; replace every local
bucket value before running Terraform.

## 1. Secure AWS access

Use the non-root IAM user you created for initial setup. An administrator
policy is appropriate for a short-lived learning environment, but do not use
the root account for daily work. Enable MFA on both the root account and this
IAM user.

The group named `admin_sg` is an **IAM group**, not an AWS security group.
That name is valid, but security groups are separate VPC network-firewall
resources created by this project.

For this project, configure either AWS IAM Identity Center or IAM access keys
for the non-root administrator. Never place access keys in this repository.

## 2. Configure the AWS CLI

Install AWS CLI v2, then configure a named profile:

```powershell
aws configure --profile portfolio-admin
aws sts get-caller-identity --profile portfolio-admin
```

Set the profile for the current PowerShell session before running Terraform:

```powershell
$env:AWS_PROFILE = 'portfolio-admin'
```

Choose an AWS region with services you intend to use. Record the same region
in your local Terraform variable files.

## 3. Bootstrap remote Terraform state

Terraform cannot store its state in an S3 bucket until that bucket exists. The
`terraform/bootstrap` configuration creates this one-time prerequisite using
local state. The resulting state file remains local and is ignored by Git.

```powershell
Set-Location terraform/bootstrap
Copy-Item terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars and set a globally unique state bucket name for your account.
terraform init
terraform plan
# Review the plan and run terraform apply only after approval.
```

After apply, copy `terraform/backend.hcl.example` to `terraform/backend.hcl`,
set its bucket to the state bucket just created, and initialise the main
configuration:

```powershell
Set-Location ../..
Copy-Item terraform/backend.hcl.example terraform/backend.hcl
Copy-Item terraform/terraform.tfvars.example terraform/terraform.tfvars
# Set your archive bucket name and confirm the region and CIDR values locally.
Set-Location terraform
terraform init -backend-config=backend.hcl
```

## 4. Validate Phase 1

From the repository root:

```powershell
.\scripts\validate.ps1
```

## 5. Manual responsibilities

- Enable MFA for root and the non-root administrator.
- Keep AWS credentials out of Git and rotate keys if they are ever exposed.
- Review `terraform plan` before every apply.
- Delete test resources when finished. Do not destroy the state bucket until all managed infrastructure has been destroyed and its state is no longer needed.

## Cost and budget note

S3 state storage has a small cost. NAT Gateway and EC2 also create ongoing
charges. Configure an AWS Budget and billing alert before deploying those
resources; the Project 1 deployment used this control. See the sanitised
[budget evidence](evidence/2026-07-25-budget-control.md).
