variable "domain_name" {
  description = "The name of the Elasticsearch domain"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "subnet_ids" {
  description = "A list of subnet IDs"
  type        = list(string)
}

variable "security_group_id" {
  description = "The ID of the security group"
  type        = string
}