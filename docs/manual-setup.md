# Manual Setup and Deployment Guide

## 1. Secure AWS access

Use the non-root IAM user you created for initial setup. An administrator
policy is appropriate for a short-lived learning environment, but do not use
the root account for daily work. Enable MFA on both the root account and this
IAM user.

The group named `admin_sg` is an **IAM group**, not an AWS security group.
That name is valid, but security groups are separate VPC network-firewall
resources created later in this project.

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
# The local file is configured for gerrard-lewu-322513863494-tf-state.
terraform init
terraform plan
# Review the plan and run terraform apply only after approval.
```

After apply, copy `terraform/backend.hcl.example` to `terraform/backend.hcl`,
replace the placeholders, then initialise the main configuration:

```powershell
Set-Location ../..
Copy-Item terraform/backend.hcl.example terraform/backend.hcl
# The example is prefilled for the approved state bucket and af-south-1.
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

## Cost note

S3 state storage has a small cost. Later phases may add billable services such
as NAT Gateway and EC2. Use AWS Budgets and billing alerts before deploying
ongoing resources.
