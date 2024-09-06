# Provider Configuration
provider "aws" {
  region = "us-east-1"  # Specify the desired AWS region
}

# EC2 Instance
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"  # Replace with your desired AMI
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleInstance"
  }
}

# EBS Volume
resource "aws_ebs_volume" "example" {
  availability_zone = aws_instance.example.availability_zone
  size              = 10  # Size in GiB
  type              = "gp3"  # Volume type
  tags = {
    Name = "ExampleVolume"
  }
}

# Attach EBS Volume to EC2 Instance
resource "aws_volume_attachment" "example" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.example.id
  instance_id = aws_instance.example.id
}
