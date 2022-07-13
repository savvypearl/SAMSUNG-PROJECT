module "app" {
    source = "../../app"

    ### vpc ###
    vpc_cidr = var.vpc_cidr
    vpc_name = var.vpc_name
    vpc_private_subnets = var.vpc_private_subnets
    vpc_public_subnets = var.vpc_public_subnets

    ### eks ###
    eks_cluster_name = var.eks_cluster_name
    eks_k8s_version = var.eks_k8s_version
    eks_subnet_ids = concat(var.vpc_public_subnets, var.vpc_private_subnets)
    eks_worker_group_one_subnet_ids = var.vpc_private_subnets
}