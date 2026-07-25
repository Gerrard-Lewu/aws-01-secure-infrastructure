mock_provider "aws" {
  mock_data "aws_iam_policy_document" {
    defaults = {
      json = "{\"Version\":\"2012-10-17\",\"Statement\":[] }"
    }
  }
}

run "secure_foundation_plan" {
  command = apply

  variables {
    aws_region           = "af-south-1"
    environment          = "test"
    project_name         = "aws-01-secure-infrastructure-test"
    availability_zones   = ["af-south-1a", "af-south-1b"]
    vpc_cidr             = "10.20.0.0/16"
    public_subnet_cidrs  = ["10.20.0.0/24", "10.20.1.0/24"]
    private_subnet_cidrs = ["10.20.10.0/24", "10.20.11.0/24"]
    instance_type        = "t3.micro"
    archive_bucket_name  = "test-archive-bucket-123456"
  }

  assert {
    condition     = module.compute.public_ip_assignment == false
    error_message = "The workload instance must not receive a public IP address."
  }

  assert {
    condition     = module.compute.imds_tokens == "required"
    error_message = "The workload instance must require IMDSv2 tokens."
  }

  assert {
    condition     = module.compute.root_volume_encrypted == true
    error_message = "The workload root volume must be encrypted."
  }

  assert {
    condition     = length(module.compute.security_group_ingress) == 0
    error_message = "The workload security group must not define inbound rules."
  }

  assert {
    condition     = one(module.compute.security_group_egress).protocol == "tcp" && one(module.compute.security_group_egress).from_port == 443 && one(module.compute.security_group_egress).to_port == 443
    error_message = "The workload security group must permit only HTTPS egress."
  }

  assert {
    condition     = module.iam.ssm_policy_arn == "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
    error_message = "The workload role must attach the Systems Manager managed policy."
  }

  assert {
    condition     = module.storage.public_access_block.block_public_acls && module.storage.public_access_block.block_public_policy && module.storage.public_access_block.ignore_public_acls && module.storage.public_access_block.restrict_public_buckets
    error_message = "The archive bucket must block all public access."
  }

  assert {
    condition     = module.storage.versioning_status == "Enabled"
    error_message = "The archive bucket must have versioning enabled."
  }

  assert {
    condition     = module.storage.encryption_algorithm == "AES256"
    error_message = "The archive bucket must use server-side encryption."
  }

  assert {
    condition     = module.storage.object_ownership == "BucketOwnerEnforced"
    error_message = "The archive bucket must enforce bucket-owner object ownership."
  }

  assert {
    condition     = module.network.public_default_route_gateway_id == module.network.internet_gateway_id
    error_message = "The public default route must target the Internet Gateway."
  }

  assert {
    condition     = module.network.private_default_route_nat_gateway_id == module.network.nat_gateway_id
    error_message = "The private default route must target the NAT Gateway."
  }

  assert {
    condition     = module.network.nat_gateway_subnet_id == module.network.first_public_subnet_id
    error_message = "The portfolio must use one NAT Gateway in the first public subnet."
  }
}

run "reject_duplicate_availability_zones" {
  command = plan

  variables {
    aws_region           = "af-south-1"
    environment          = "test"
    project_name         = "aws-01-secure-infrastructure-test"
    availability_zones   = ["af-south-1a", "af-south-1a"]
    vpc_cidr             = "10.20.0.0/16"
    public_subnet_cidrs  = ["10.20.0.0/24", "10.20.1.0/24"]
    private_subnet_cidrs = ["10.20.10.0/24", "10.20.11.0/24"]
    instance_type        = "t3.micro"
    archive_bucket_name  = "test-archive-bucket-123456"
  }

  expect_failures = [var.availability_zones]
}

run "reject_invalid_subnet_lists" {
  command = plan

  variables {
    aws_region           = "af-south-1"
    environment          = "test"
    project_name         = "aws-01-secure-infrastructure-test"
    availability_zones   = ["af-south-1a", "af-south-1b"]
    vpc_cidr             = "10.20.0.0/16"
    public_subnet_cidrs  = ["not-a-cidr"]
    private_subnet_cidrs = ["10.20.10.0/24", "10.20.10.0/24"]
    instance_type        = "t3.micro"
    archive_bucket_name  = "test-archive-bucket-123456"
  }

  expect_failures = [var.public_subnet_cidrs, var.private_subnet_cidrs]
}
