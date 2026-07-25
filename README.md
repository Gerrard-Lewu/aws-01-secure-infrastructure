# Project 1 — Secure AWS Infrastructure Foundation

Terraform foundation for a secure, repeatable AWS workload environment. This is
the first project in a three-part cloud engineering portfolio.

| Project | Responsibility |
| --- | --- |
| 1. Secure AWS Infrastructure Foundation | VPC, private compute, IAM baseline, encrypted storage, and Terraform state |
| 2. Monitoring and Operational Automation | CloudWatch telemetry, dashboards, alarms, and notifications |
| 3. CI/CD for Infrastructure | GitHub Actions, validation, plans, approvals, and controlled applies |

## Business problem

Teams that configure cloud infrastructure manually can introduce inconsistent
networking, over-permissive access, and configuration drift. This project
creates a documented AWS baseline that can be reproduced through Terraform.

## Phase 1 status

Phase 1 establishes the repository, Terraform conventions, remote-state
bootstrap, documentation, and local validation workflow. It deliberately does
not create the VPC or EC2 workload yet; those are the next implementation
phase.

## Architecture direction

The completed project will use a two-AZ VPC, public subnets for controlled
egress, private subnets for an EC2 workload, AWS Systems Manager rather than
internet-exposed SSH, and private encrypted S3 storage. See
[the architecture overview](docs/architecture/overview.md) and
[the PRD](docs/PRD.md).

## Quick start

1. Complete the AWS account and local setup in [docs/manual-setup.md](docs/manual-setup.md).
2. Create the remote-state bucket from `terraform/bootstrap`.
3. Create `terraform/backend.hcl` from `terraform/backend.hcl.example`.
4. Run `scripts/validate.ps1`.

Do not commit `terraform.tfvars`, `backend.hcl`, Terraform state, or AWS
credentials.

## Decisions

The engineering decisions and their rationale are recorded in
[docs/adr](docs/adr). The scope boundaries between the three projects are in
[docs/scope-boundaries.md](docs/scope-boundaries.md).

## Cost and teardown

The bootstrap S3 bucket has low storage cost, but deployed resources in later
phases (particularly NAT Gateway) can incur ongoing charges. Follow the
teardown guidance in [docs/manual-setup.md](docs/manual-setup.md) when you are
finished testing.

## License

See [LICENSE](LICENSE).
