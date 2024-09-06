output "cluster_id" {
  description = "The ID of the EKS cluster"
  value       = module.eks.cluster_id
}

output "node_group_id" {
  description = "The ID of the EKS node group"
  value       = module.eks.node_group_id
}
