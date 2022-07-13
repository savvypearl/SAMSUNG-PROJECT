variable "region" {
  default = "us-east-2"
}

variable "eks_subnet_ids" {
  description = "subnet ids for eks"
}
variable "eks_cluster_name" {
  description = "cluster name for eks"
}

variable "eks_k8s_version" {
  description = "version of k8s to be deployed"
}

variable "eks_worker_group_one_subnet_ids" {
  description = "worker group one subnet ids"
}