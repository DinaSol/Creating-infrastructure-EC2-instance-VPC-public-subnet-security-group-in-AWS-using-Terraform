#  creating VPC that has subnet connected to Internet Gateway 
    # that allows to the EC2 will be created in that subnet to reach internet 
resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "dina-main-vpc"
  }
}

# create the public subnet 
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "dina-main-public-subnet"
  }
}

# creating a internet_gateway that will be connected to dina-main-public-subnet
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "dina-gw"
  }
}
# creating a route table for dina-main-public-subnet, to add a route to the internet gateway
resource "aws_route_table" "public_subnet_route_table" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "dina-public-subnet-route-table"
  }
}

# associate the route table to the subnet "dina-main-public-subnet"
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_subnet_route_table.id
}
