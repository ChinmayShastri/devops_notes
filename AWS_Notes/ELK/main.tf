provider "aws" {
  region = "us-east-1"
}

module "elasticsearch" {
  source = "terraform-aws-modules/elasticsearch/aws"
  version = "~> 0.12.0"

  domain_name           = var.domain_name
  elasticsearch_version = "7.7"
  instance_type         = "m5.large.elasticsearch"
  instance_count        = 2
  ebs_volume_size       = 10
  zone_awareness_enabled = true
  dedicated_master_enabled = true
  dedicated_master_type    = "m5.large.elasticsearch"
  dedicated_master_count   = 3
  encrypt_at_rest_enabled  = true
  node_to_node_encryption_enabled = true

  tags = {
    Name = "example-elasticsearch"
  }
}

module "kibana" {
  source = "terraform-aws-modules/kibana/aws"
  version = "~> 0.1.0"

  domain_name = module.elasticsearch.domain_name
  cognito_enabled = true
  vpc_id = var.vpc_id
  subnet_ids = var.subnet_ids
  security_group_ids = [var.security_group_id]
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "subnet" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
}

resource "aws_security_group" "sg" {
  vpc_id = aws_vpc.main.id

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "elasticsearch_endpoint" {
  value = module.elasticsearch.endpoint
}

output "kibana_endpoint" {
  value = module.kibana.endpoint
}