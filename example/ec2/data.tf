data "aws_vpcs" "arc_test_vpc" {
  filter {
    name   = "tag:Name"
    values = ["${var.namespace}-${var.environment}-vpc"]
  }
}

data "aws_subnet" "arc_test_subnet" {
  filter {
    name   = "tag:Name"
    values = ["${var.namespace}-${var.environment}-vpc-public-1"]
  }
}