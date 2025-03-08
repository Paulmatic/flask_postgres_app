resource "aws_vpc" "flask_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "flask-vpc"
  }
}

resource "aws_subnet" "flask_subnet" {
  vpc_id                  = aws_vpc.flask_vpc.id
  cidr_block              = var.subnet_cidr
  map_public_ip_on_launch = true

  tags = {
    Name = "flask-subnet"
  }
}

resource "aws_internet_gateway" "flask_gw" {
  vpc_id = aws_vpc.flask_vpc.id

  tags = {
    Name = "flask-gateway"
  }
}

resource "aws_route_table" "flask_route_table" {
  vpc_id = aws_vpc.flask_vpc.id
}

resource "aws_route" "internet_access" {
  route_table_id         = aws_route_table.flask_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.flask_gw.id
}

resource "aws_route_table_association" "flask_association" {
  subnet_id      = aws_subnet.flask_subnet.id
  route_table_id = aws_route_table.flask_route_table.id
}
