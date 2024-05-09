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

resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  tags                 = var.vpc_tags

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_subnet" "public" {
  count                   = length(var.public_subnet_cidr_blocks)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr_blocks[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true
  tags                    = merge(var.public_subnet_tags, { "Name" = "${var.vpc_name}-public-${count.index + 1}" })
}

resource "aws_subnet" "private" {
  count             = length(var.private_subnet_cidr_blocks)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidr_blocks[count.index]
  availability_zone = var.availability_zones[count.index]
  tags              = merge(var.private_subnet_tags, { "Name" = "${var.vpc_name}-private-${count.index + 1}" })
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.public)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_nat_gateway" "nat" {
  count         = var.enable_nat_gateway ? length(aws_subnet.private) : 0
  subnet_id     = aws_subnet.public[count.index].id
  allocation_id = aws_eip.nat[count.index].id
}

resource "aws_eip" "nat" {
  count = var.enable_nat_gateway ? length(aws_subnet.private) : 0
}
