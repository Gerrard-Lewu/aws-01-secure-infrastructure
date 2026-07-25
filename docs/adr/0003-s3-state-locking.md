# ADR 0003: Use Encrypted, Versioned S3 Remote State with Lock Files

- **Status:** Accepted
- **Decision:** Store Terraform state in a dedicated private S3 bucket using
  encryption, versioning, blocked public access, and Terraform's S3 lock file.

## Context

Local state can be lost, exposes infrastructure details on a workstation, and
cannot safely support shared automation.

## Rationale

S3 provides durable state storage. Versioning supports recovery from accidental
state changes; encryption and blocked public access protect the state; lock
files prevent concurrent Terraform operations.

## Consequences

The state bucket must be bootstrapped before the main Terraform configuration.
Its name must be globally unique and is kept in local backend configuration,
not committed to this repository.
