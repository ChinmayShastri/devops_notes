# Provider Configuration
provider "aws" {
  region = "us-east-1"  # Specify the desired AWS region
}

# Launch Template
resource "aws_launch_template" "example" {
  name_prefix   = "example-"
  image_id      = "ami-0c55b159cbfafe1f0"  # Replace with your desired AMI
  instance_type = "t2.micro"

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "ExampleInstance"
    }
  }
}

# Auto Scaling Group
resource "aws_autoscaling_group" "example" {
  launch_template {
    id      = aws_launch_template.example.id
    version = "$Latest"
  }
  
  min_size             = 1
  max_size             = 3
  desired_capacity     = 2
  vpc_zone_identifier  = ["subnet-12345678"]  # Replace with your subnet ID

  tag {
    key                 = "Name"
    value               = "ExampleASG"
    propagate_at_launch = true
  }

  # Health Check Configuration
  health_check_type         = "EC2"
  health_check_grace_period = 300

  # Scaling Policies
  scaling_policies {
    policy_type = "TargetTrackingScaling"
    target_tracking_configuration {
      predefined_metric_specification {
        predefined_metric_type = "ASGAverageCPUUtilization"
      }
      target_value = 50.0
    }
  }
}

# Auto Scaling Policies
resource "aws_autoscaling_policy" "scale_up" {
  name                   = "scale_up"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.example.name
}

resource "aws_autoscaling_policy" "scale_down" {
  name                   = "scale_down"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.your_autoscaling_group_name.name
}