module "eks" {
  source          = "registry.terraform.io/terraform-aws-modules/eks/aws"
  version         = "17.24.0"
  cluster_name    = var.eks_cluster_name
  cluster_version = var.eks_k8s_version
  subnets         = var.eks_subnet_ids

  workers_group_defaults = {
    root_volume_type = "gp2"
  }

  worker_groups = [
    {
      name                          = "worker-group-1"
      instance_type                 = "t2.small"
      additional_userdata           = "echo foo bar"
      additional_security_group_ids = [aws_security_group.worker_group_mgmt_one.id]
      asg_desired_capacity          = 2
      subnets                       = var.eks_worker_group_one_subnet_ids
    }
  ]

}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}