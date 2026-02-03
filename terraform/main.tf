module "networking" {
  source = "./modules/networking"

  project_name = var.project_name
  environment  = var.environment

  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
}

module "compute" {
  source = "./modules/compute"

  project_name = var.project_name
  environment  = var.environment

  vpc_id             = module.networking.vpc_id
  public_subnet_ids  = module.networking.public_subnet_ids
  private_subnet_ids = module.networking.private_subnet_ids

  ami_id = var.ami_id
}

module "monitoring" {
  source = "./modules/monitoring"
}
module "storage" {
  source = "./modules/storage"

  project_name = var.project_name
  environment  = var.environment
  aws_region   = var.aws_region
}
module "cache" {
  source = "./modules/cache"

  project_name = var.project_name
  environment  = var.environment

  vpc_id             = module.networking.vpc_id
  private_subnet_ids = module.networking.private_subnet_ids

  backend_security_group_id = module.compute.ec2_security_group_id
}
