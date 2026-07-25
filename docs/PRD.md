# PRD — Project 1: Secure AWS Infrastructure Foundation

## Purpose

Create a secure, repeatable AWS workload foundation using Terraform. The
project demonstrates infrastructure-as-code, network segmentation,
least-privilege access, secure state handling, and clear operational
documentation.

## Business problem

A small company needs a consistent AWS environment for internal workloads
across development, staging, and production-like environments. Manual console
configuration causes configuration drift, inconsistent security controls, and
difficult recovery.

## Goals

- Provision infrastructure through Terraform rather than manual console work.
- Build a VPC across two Availability Zones with public and private subnets.
- Run a Linux EC2 workload privately, without a public IP address.
- Use AWS Systems Manager for managed access instead of public SSH.
- Store Terraform state and the archive bucket in private encrypted S3.
- Keep the design parameterised for multiple environments.

## Scope

### In scope

- Terraform configuration, modules, variables, and remote state.
- VPC, routing, security groups, IAM baseline, private EC2, and S3 storage.
- Architecture, deployment, validation, and teardown documentation.

### Out of scope

- CloudWatch dashboards, alarms, log analysis, and notifications (Project 2).
- GitHub Actions, pull-request checks, approvals, and automated applies (Project 3).
- Application code and application delivery.

## Success criteria

- Terraform formatting, validation, and plan complete successfully.
- The intended environment is reproducible without manual infrastructure configuration.
- The deployed EC2 workload has no public IP and no inbound security-group rule.
- Terraform state is stored in encrypted, versioned, private S3 storage.
- A reviewer can follow the repository documentation to deploy, validate, and destroy the environment.

## Delivery phases

1. **Foundation:** repository, remote state bootstrap, conventions, and documentation — complete.
2. **Networking:** VPC, subnet, routing, and security-group implementation — complete.
3. **Compute and storage:** private EC2, Systems Manager role, and archive storage — complete.
4. **Validation and portfolio evidence:** architecture diagram, deployment evidence, and production trade-offs — complete.

See [scope boundaries](scope-boundaries.md) and [architecture overview](architecture/overview.md).
