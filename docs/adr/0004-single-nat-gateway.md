# ADR 0004: Use One NAT Gateway for the Initial Portfolio Environment

- **Status:** Accepted
- **Decision:** Deploy one NAT Gateway in the first public subnet and route both private subnets through it.

## Context

The VPC uses two Availability Zones, while the initial workload is a single private EC2 instance. A NAT Gateway is needed for the instance to reach AWS Systems Manager and HTTPS package repositories without accepting inbound internet traffic.

## Rationale

One NAT Gateway keeps the environment production-inspired while controlling ongoing portfolio cost. The network remains ready to evolve into a high-availability design.

## Consequences

Private-subnet outbound access depends on the Availability Zone hosting the NAT Gateway. A production design would use one NAT Gateway per Availability Zone and route each private subnet to its local NAT Gateway.
