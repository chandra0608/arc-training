data "aws_vpc" "arc_test_vpc" {
  filter {
    name   = "tag:Name"
    values = ["${var.namespace}-${var.environment}-vpc"]
  }
}

data "aws_subnets" "arc_test_subnet" {
  filter {
    name = "tag:Name"

    values = [
      "${var.namespace}-${var.environment}-vpc-private-1",
      "${var.namespace}-${var.environment}-vpc-private-2",
    ]
  }
}
