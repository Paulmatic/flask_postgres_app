variable "aws_region" {
  description = "AWS region to deploy resources"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block for the public subnet"
  default     = "10.0.1.0/24"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "db_name" {
  description = "PostgreSQL database name"
  default     = "users_db"
}

variable "db_user" {
  description = "PostgreSQL username"
  default     = "admin"
}

variable "db_password" {
  description = "PostgreSQL password"
  sensitive   = true
}
