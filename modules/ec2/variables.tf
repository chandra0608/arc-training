variable "vpc_id" {
  description = "The ID of the VPC where the security group and EC2 instance will be created."
}

variable "name" {
  description = "The name prefix for resources such as the security group, key pair, and EC2 instance."
}

variable "ami" {
  description = "The AMI to use for the EC2 instance."
  type        = map
}

variable "subnet" {
  description = "The ID of the subnet where the EC2 instance will be launched."
}

variable "availability_zone" {
  description = "The availability zone for the EC2 instance."
}

variable "associate_public_ip" {
  description = "Whether the EC2 instance should have a public IP address."
  type        = bool
}

variable "ebs_optimized" {
  description = "Whether the EC2 instance should be EBS-optimized."
  type        = bool
}


variable "key_name" {
  description = "The name prefix for key pair"
}

variable "security_group_name" {
  description = "The name prefix for key pair"
  type = string
}

variable "root_volume_type" {
  description = "The type of root volume for the EC2 instance (e.g., gp2, io1)."
}

variable "root_volume_size" {
  description = "The size of the root volume for the EC2 instance (in GB)."
  type        = number
}

variable "tags" {
  description = "A map of tags to apply to the resources."
  type        = map(string)
}

# variable "security_groups" {
#   type = object({
#     id = list(string)
#   })
# }


variable "ingress_rules" {
  description = "A list of ingress rules for the security group."
  type        = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "egress_rules" {
  description = "A list of egress rules for the security group."
  type        = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}
