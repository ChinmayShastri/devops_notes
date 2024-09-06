variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
  default     = "example-eks-cluster"
}

variable "cluster_version" {
  description = "The Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.21"
}

variable "node_group_name" {
  description = "The name of the EKS node group"
  type        = string
  default     = "example-eks-nodes"
}

variable "node_group_size" {
  description = "The desired number of nodes in the EKS node group"
  type        = number
  default     = 2
}

variable "ssh_key_name" {
  description = "The SSH key pair name for the nodes"
  type        = string
  default     = "my-key-pair"
}

variable "subnet_ids" {
  description = "The VPC subnets to associate with the EKS cluster"
  type        = list(string)
  default     = ["subnet-12345678", "subnet-87654321"]
}
