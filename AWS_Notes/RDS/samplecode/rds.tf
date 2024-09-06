# Provider Configuration
provider "aws" {
  region = "us-east-1"  # Specify the desired AWS region
}

# RDS Instance
resource "aws_db_instance" "example" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  db_name                 = "exampledb"
  username             = "admin"
  password             = "password123"  # Replace with a secure password
  parameter_group_name = "default.mysql8.0"
  publicly_accessible  = true

  tags = {
    Name = "ExampleDBInstance"
  }
}