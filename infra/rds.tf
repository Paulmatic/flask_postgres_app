resource "aws_db_instance" "flask_rds" {
  allocated_storage    = 10
  engine              = "postgres"
  engine_version      = "14"
  instance_class      = "db.t3.micro"
  username           = var.db_user
  password           = var.db_password
  db_name            = var.db_name
  publicly_accessible = false
  skip_final_snapshot = true

  tags = {
    Name = "flask-rds"
  }
}
