variable "region" {
  default = "us-east-2"
}

variable "eks_cluster_name" {
  description = "cluster name for eks"
}

variable "eks_k8s_version" {
  description = "version of k8s to be deployed"
}

variable "vpc_name" {
  description = "vpc name"
}
variable "vpc_cidr" {
  description = "vpc cidr"
}
variable "vpc_private_subnets" {
  description = "vpc private subnets"
}
variable "vpc_public_subnets" {
  description = "vpc public subnets"
}