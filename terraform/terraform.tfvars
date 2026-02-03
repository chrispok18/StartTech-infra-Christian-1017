aws_region   = "eu-west-1"
project_name = "starttech"
environment  = "prod"

vpc_cidr = "10.0.0.0/16"

# 2 public subnets (for ALB)
public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]

# 2 private subnets (for EC2, Redis)
private_subnet_cidrs = ["10.0.101.0/24", "10.0.102.0/24"]

# 2 availability zones in eu-west-1
availability_zones = ["eu-west-1a", "eu-west-1b"]
ami_id             = "ami-0f007bf1d5c770c6e"
