variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "The Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.21"
}

variable "node_group_name" {
  description = "The name of the EKS node group"
  type        = string
}

variable "node_group_size" {
  description = "The desired number of nodes in the EKS node group"
  type        = number
  default     = 2
}

variable "ssh_key_name" {
  description = "The SSH key pair name for the nodes"
  type        = string
}

variable "subnet_ids" {
  description = "The VPC subnets to associate with the EKS cluster"
  type        = list(string)
}