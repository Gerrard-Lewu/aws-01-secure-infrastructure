# AWS Secure Infrastructure Automation

> A secure and repeatable AWS environment for a small local-business directory application, provisioned through Terraform.

## Project Status

Planning and repository setup.

## Discovery

I built this application because, while developing Kaeelo, I realised that building application features was only one part of delivering a dependable product.

Kaeelo involved multiple user roles, business listings, image uploads, notifications, payments and tightly controlled permissions. Although I had worked extensively on the application itself, I wanted to understand how I would design and operate the underlying cloud environment without relying on manual infrastructure configuration.

I therefore created a small local-business directory service inspired by that experience and designed the AWS infrastructure required to run it securely.

The project focuses on using Terraform to create repeatable infrastructure, placing application servers in private subnets, controlling access through least-privilege permissions and making the environment reproducible.

## Project at a Glance

| Area | Planned implementation |
|---|---|
| Cloud provider | AWS |
| Infrastructure as Code | Terraform |
| Application | Small containerized business-directory service |
| Networking | Public and private subnets |
| Compute | Private EC2 workload |
| Public entry point | Application Load Balancer |
| Administration | AWS Systems Manager |
| Storage | Encrypted Amazon S3 |
| Version control | GitHub Flow and Conventional Commits |

## Quick Navigation

- [Architecture decisions](docs/adr/)
- [Architecture documentation](docs/architecture/)
- [Engineering journal](docs/engineering-journal/)
- [Testing evidence](docs/evidence/)
- [Research notes](docs/research/)
- [AI usage](docs/ai-usage.md)

## Business Problem

To be completed during project discovery.

## Architecture

To be completed before infrastructure implementation.

## Deployment

Not yet available.

## Measured Results

Measurements will be added after deployment and testing.

## Production Improvements

To be completed after the working environment is evaluated.
