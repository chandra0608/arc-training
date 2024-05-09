# terraform.tfvars
environment         = "test"
namespace           = "arc"
key_name            = "arc-key"
availability_zone   = "us-east-1a"
ebs_optimized       = false
root_volume_type    = "gp2"
root_volume_size    = 30
associate_public_ip = true
ami = {
  id            = "ami-07caf09b362be10b8"
  instance_type = "t2.micro"
}

## sg_rules ####
name = "arc-test"

ingress_rules = [
  {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  # Add more ingress rules as needed
]
egress_rules = [
  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  },
  # Add more egress rules as needed
]
tags = {
  Name        = "example"
  Environment = "development"
  # Add more tags as needed
}

