# Production Considerations

This portfolio environment makes deliberate cost and scope trade-offs.

## Availability

The network spans two Availability Zones, but the first implementation uses a single NAT Gateway and a single EC2 instance. Production workloads would use NAT Gateway per Availability Zone and a multi-instance workload behind a load balancer where the application requires high availability.

## Identity and network access

The EC2 instance uses Systems Manager rather than inbound SSH. A production environment should add permission boundaries, IAM Identity Center, VPC endpoints for private AWS service access, and more narrowly scoped instance policies.

## Security and operations

Project 2 will add CloudWatch logs, metrics, alarms, and notifications. Project 3 will add GitHub OIDC, Terraform checks, approval gates, and controlled deployment. AWS Config, GuardDuty, Security Hub, backup policies, and central CloudTrail are logical production extensions but are outside Project 1.
