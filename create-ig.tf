# Creating Internet-Gateway(IG)
resource "aws_internet_gateway" "proj_IG" {
  vpc_id = aws_vpc.proj-vpc.id

  tags = {
    Name = "project-IG"
  }

}

# Creating the route table

resource "aws_route_table" "webapp-route-table" {
  vpc_id = aws_vpc.proj-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.proj_IG.id
  }

  tags = {
    Name = "webapp-route-table"
  }
}

