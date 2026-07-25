# ADR 0002: Use Private EC2 and AWS Systems Manager

- **Status:** Accepted
- **Decision:** The workload EC2 instance will have no public IP and will be
  managed through AWS Systems Manager.

## Context

Opening SSH to the internet, even with a restricted CIDR, increases attack
surface and key-management overhead.

## Rationale

Systems Manager provides authenticated, auditable administrative access without
an internet-exposed SSH service or bastion host. This better demonstrates a
secure-by-default design for the portfolio scope.

## Consequences

The instance needs an IAM instance profile and network access to Systems
Manager, through appropriate outbound routing or VPC endpoints. The exact
network implementation will be documented in the networking phase.
