resource "aws_instance" "flask_ec2" {
  ami             = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI
  instance_type   = var.instance_type
  subnet_id       = aws_subnet.flask_subnet.id
  security_groups = [aws_security_group.flask_sg.name]

  tags = {
    Name = "flask-ec2-instance"
  }
}
