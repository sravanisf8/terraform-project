resource "aws_nat_gateway" "Project_NATGW" {
  allocation_id = aws_eip.nat_gateway_EIP.id
  subnet_id     = aws_subnet.publicsubnet-2.id

  tags = {
    Name = "gw NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.proj_IG]
}

resource "aws_eip" "nat_gateway_EIP" {
  vpc = true
}


resource "aws_route_table" "nat_gateway" {
  vpc_id = aws_vpc.proj-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.proj_IG.id
  }
}


