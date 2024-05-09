
###### network tfvars #####
vpc_cidr_block             = "10.0.0.0/16"
public_subnet_cidr_blocks  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidr_blocks = ["10.0.3.0/24", "10.0.4.0/24"]
availability_zones         = ["us-east-1a", "us-east-1b"]
enable_nat_gateway         = true
vpc_name                   = "arc-test-vpc"
public_subnet_tags         = { "Environment" = "arc-test", "Type" = "Public" }
private_subnet_tags        = { "Environment" = "arc-test", "Type" = "Private" }
vpc_tags                   = { "Name" = "arc-test-vpc" }

