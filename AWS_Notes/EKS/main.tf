provider "aws" {
  region = "us-east-1"
}

module "eks" {
  source          = "./eks"
  cluster_name    = "example-eks-cluster"
  cluster_version = "1.21"
  node_group_name = "example-eks-nodes"
  node_group_size = 2
  ssh_key_name    = "my-key-pair"
}
