module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.8.1"

  # VPC Basic configuration
  name = "Sehindemi-Vpc"
  cidr = "10.0.0.0/16"

  # Availablity Zones and Subnets
  azs = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.1.0/24","10.0.3.0/24"]
  public_subnets = ["10.0.2.0/24","10.0.4.0/24"]
  database_subnets = ["10.0.5.0/24", "10.0.6.0/24"]

  #Database Subnet Group and Route Table 
  create_database_subnet_group = true
  create_database_subnet_route_table = true
  create_database_internet_gateway_route = false
  create_database_nat_gateway_route = false

  # NatGateway
  enable_nat_gateway = true
  single_nat_gateway = true

  # DNS Configuration 
  enable_dns_hostnames = true
  enable_dns_support = true

  # Tags
  public_subnet_tags = {
    name = "public_subent"
  }

  private_subnet_tags = {
    name = "private_subnet"
  }

  database_subnet_tags = {
    name = "database subet tags"
  }

  vpc_tags = {
    name = "Sehindemi-VPC"
  }
}

