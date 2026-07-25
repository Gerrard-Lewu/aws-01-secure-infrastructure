# Architecture Overview

## Target design

```text
AWS Account
└── VPC across two Availability Zones
    ├── Public subnets: Internet Gateway and one NAT Gateway
    ├── Private subnets: Linux EC2 workload, no public IP
    ├── Security groups: least-privilege traffic rules
    ├── IAM instance profile: AWS Systems Manager access
    └── S3: Terraform state, future backup archive, future diagnostic archive
```

## Why this design

- **Private compute:** removes direct internet reachability from the workload.
- **Two AZs:** demonstrates an availability-aware network layout even while the
  initial portfolio workload remains deliberately small.
- **Systems Manager:** supports managed access without opening port 22 to the
  internet or maintaining a bastion host.
- **S3 remote state:** keeps Terraform state durable and separate from an
  engineer's workstation.
- **Single NAT Gateway:** permits controlled HTTPS egress from private
  workloads while keeping the initial environment affordable; this is an
  intentional availability trade-off.
- **Modular Terraform:** keeps network, identity, compute, and storage concerns
  independently understandable and easier to extend.

The detailed resource implementation begins in the networking phase. This
document records the intended architecture so implementation decisions can be
checked against it.
