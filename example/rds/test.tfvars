# Network Vars
region              = "us-east-1"
multi_az            = false
publicly_accessible = true

# DB Vars
db_engine                   = "mysql"
db_engine_version           = "8.0.35"
db_storage_type             = "gp2"
db_username                 = "admin"
db_instance_class           = "db.t3.micro"
db_storage_size             = 20
set_secret_manager_password = true
set_db_password             = false
db_password                 = "password"

# Security Group Vars
ingress_rules = [
  {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
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

# Backup vars
backup_retention_period  = 7
delete_automated_backups = true
skip_final_snapshot      = true
apply_immediately        = true

# Tag Vars
environment = "test"
namespace   = "arc"
