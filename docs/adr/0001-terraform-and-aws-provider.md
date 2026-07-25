# ADR 0001: Use Terraform with the AWS Provider

- **Status:** Accepted
- **Decision:** Use Terraform and the official AWS provider for this project.

## Context

The project must show that an AWS environment can be recreated from versioned,
reviewable source rather than configured manually in the console.

## Rationale

Terraform provides a clear plan/apply workflow, modular configuration, and a
natural path to the GitHub Actions controls planned for Project 3.

## Consequences

Terraform state needs careful handling. This repository therefore bootstraps a
private, encrypted, versioned S3 state bucket before the main configuration is
initialised.
