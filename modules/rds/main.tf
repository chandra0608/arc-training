# Create a DB security group
resource "aws_security_group" "rds_security_group" {
  name        = "${var.environment}-${var.namespace}-rds-sg"
  description = "Security group for RDS instance"
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

  tags = merge(
    {
      Name        = "${var.environment}-${var.namespace}-rds-sg",
      Environment = var.environment,
      namespace   = var.namespace,
    },
    var.tags
  )
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "${var.environment}-${var.namespace}-subnet-group"
  subnet_ids = var.subnet_ids
}

resource "aws_db_instance" "rds_instance" {
  identifier                  = "${var.environment}-${var.namespace}-db"
  engine                      = var.db_engine
  engine_version              = var.db_engine_version
  instance_class              = var.db_instance_class
  allocated_storage           = var.db_storage_size
  storage_type                = var.db_storage_type
  manage_master_user_password = var.set_secret_manager_password ? true : null
  username                    = var.db_username
  password                    = var.set_db_password ? var.db_password : null
  db_subnet_group_name        = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids      = [aws_security_group.rds_security_group.id]
  backup_retention_period     = var.backup_retention_period
  multi_az                    = var.multi_az
  delete_automated_backups    = var.delete_automated_backups
  publicly_accessible         = var.publicly_accessible
  skip_final_snapshot         = var.skip_final_snapshot
  apply_immediately           = var.apply_immediately

  tags = merge(
    {
      Name        = "${var.environment}-${var.namespace}-db",
      Environment = var.environment,
      namespace   = var.namespace,
    },
    var.tags
  )
}
