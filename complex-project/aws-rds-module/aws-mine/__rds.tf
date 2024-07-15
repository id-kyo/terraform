# ===============================================
# RDS MODULES - PostgreSQL
# ===============================================
module "db_postgres" {
  source = "terraform-aws-modules/rds/aws"

  identifier                     = "${local.name}-default"
  instance_use_identifier_prefix = true

  create_db_option_group    = false
  create_db_parameter_group = false

  engine               = "postgres"
  engine_version       = "13.13"
  family               = "postgres13"  # DB parameter group family
  major_engine_version = "13"         # DB option group major version
  instance_class       = "db.t3.micro"
  storage_type         = "gp3"
  allocated_storage    = 20

  db_name  = "postgresql"
  username = "postgres"
  password = "HG!SDFJK#AasdGY23GAS"
  port     = 5432

  db_subnet_group_name   = module.vpc.database_subnet_group
  vpc_security_group_ids = [module.security_group.security_group_id]

  maintenance_window      = "Mon:00:00-Mon:03:00"
  backup_window           = "03:00-06:00"
  backup_retention_period = 0

  tags = local.tags
}