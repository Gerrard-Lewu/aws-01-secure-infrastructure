locals {
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

module "network" {
  source = "./modules/network"

  project_name         = var.project_name
  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  availability_zones   = var.availability_zones
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  common_tags          = local.common_tags
}

module "iam" {
  source = "./modules/iam"

  project_name = var.project_name
  environment  = var.environment
  common_tags  = local.common_tags
}

module "compute" {
  source = "./modules/compute"

  project_name      = var.project_name
  environment       = var.environment
  instance_type     = var.instance_type
  private_subnet_id = module.network.private_subnet_ids[0]
  vpc_id            = module.network.vpc_id
  instance_profile  = module.iam.instance_profile_name
  common_tags       = local.common_tags
}

module "storage" {
  source = "./modules/storage"

  project_name        = var.project_name
  environment         = var.environment
  archive_bucket_name = var.archive_bucket_name
  common_tags         = local.common_tags
}
