data "aws_availability_zones" "available" {}

module "vpc" {
  source  = "registry.terraform.io/terraform-aws-modules/vpc/aws"
  version = "3.2.0"

  name                 = var.vpc_name
  cidr                 = var.vpc_cidr
  azs                  = data.aws_availability_zones.available.names
  private_subnets      = var.vpc_private_subnets
  public_subnets       = var.vpc_public_subnets
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  tags = {
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
  }

  public_subnet_tags = {
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = "1"
  }
}