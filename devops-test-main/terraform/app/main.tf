module "vpc" {
    source = "../modules/vpc"
    eks_cluster_name = var.eks_cluster_name
    vpc_name = var.vpc_name
    vpc_cidr = var.vpc_cidr
    vpc_private_subnets = var.vpc_private_subnets
    vpc_public_subnets = var.vpc_public_subnets
}

module "eks" {
    source = "../modules/eks"
    eks_cluster_name = var.eks_cluster_name
    eks_k8s_version = var.eks_k8s_version
    eks_subnet_ids = var.eks_subnet_ids
    eks_worker_group_one_subnet_ids = var.eks_worker_group_one_subnet_ids
}