module "ec2_instance" {
  source = "../../modules/ec2" // Path to your module

  name                = var.name
  vpc_id              = data.aws_vpcs.arc_test_vpc.id
  subnet              = data.aws_subnet.arc_test_subnet.id
  availability_zone   = var.availability_zone
  ebs_optimized       = var.ebs_optimized
  ami                 = var.ami
  ingress_rules       = var.ingress_rules
  egress_rules        = var.egress_rules
  root_volume_type    = var.root_volume_type
  root_volume_size    = var.root_volume_size
  security_group_name = "${var.name}-security-group"
  key_name            = var.key_name
  associate_public_ip = var.associate_public_ip

  tags = var.tags
}