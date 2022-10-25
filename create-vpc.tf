# Creating VPC
resource "aws_vpc" "proj-vpc" {
  cidr_block       = "10.10.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Project-VPC"
  }
}

# Creating the subnets

resource "aws_subnet" "publicsubnet-1" {
  vpc_id     = aws_vpc.proj-vpc.id
  cidr_block = "10.10.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "PUBLIC-SUBNET-1"
  }
}

resource "aws_subnet" "privatesubnet-1" {
  vpc_id     = aws_vpc.proj-vpc.id
  cidr_block = "10.10.3.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "PRIVATE-SUBNET-1"
  }
}

resource "aws_subnet" "publicsubnet-2" {
  vpc_id     = aws_vpc.proj-vpc.id
  cidr_block = "10.10.2.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "PUBLIC-SUBNET-2"
  }
}

resource "aws_subnet" "privatesubnet-2" {
  vpc_id     = aws_vpc.proj-vpc.id
  cidr_block = "10.10.4.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "PRIVATE-SUBNET-2"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.publicsubnet-1.id
  route_table_id = aws_route_table.webapp-route-table.id
}
resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.publicsubnet-2.id
  route_table_id = aws_route_table.webapp-route-table.id
}
resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.privatesubnet-1.id
  route_table_id = aws_route_table.nat_gateway.id
}
resource "aws_route_table_association" "d" {
  subnet_id      = aws_subnet.privatesubnet-2.id
  route_table_id = aws_route_table.nat_gateway.id
}