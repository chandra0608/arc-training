terraform {
  required_version = "~> 1.5"

  required_providers {
    aws = {
      version = "~> 4.0"
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = var.region # Change to your desired region
}

resource "aws_security_group" "ec2_instance_sg" {
  name        = var.security_group_name
  description = "ec2_instance security group"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = var.egress_rules
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }

  tags = var.tags
}



resource "tls_private_key" "httpdkey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

// Creating AWS key-pair

resource "aws_key_pair" "generated_key" {
  key_name   = var.name
  public_key = tls_private_key.httpdkey.public_key_openssh
}

# Create EC2 instance
resource "aws_instance" "ec2_instance" {
  ami               = var.ami.id
  instance_type     = var.ami.instance_type
  subnet_id         = var.subnet
  key_name          = var.name
  availability_zone = var.availability_zone
  security_groups   = [aws_security_group.ec2_instance_sg.id]
  ebs_optimized     = var.ebs_optimized
  root_block_device {
    volume_type = var.root_volume_type
    volume_size = var.root_volume_size
  }

  # Add any other configuration options you need for your EC2 instance

  tags = var.tags

}
