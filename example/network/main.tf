module "network" {
  source = "../../modules/network"

  vpc_cidr_block             = var.vpc_cidr_block
  public_subnet_cidr_blocks  = var.public_subnet_cidr_blocks
  private_subnet_cidr_blocks = var.private_subnet_cidr_blocks
  availability_zones         = var.availability_zones
  enable_nat_gateway         = var.enable_nat_gateway
  vpc_name                   = var.vpc_name
  public_subnet_tags         = var.public_subnet_tags
  private_subnet_tags        = var.private_subnet_tags
  vpc_tags                   = var.vpc_tags
}
