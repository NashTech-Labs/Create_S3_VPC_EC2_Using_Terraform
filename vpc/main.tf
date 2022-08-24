resource "aws_vpc" "proj-vpc" {
  cidr_block       = "10.0.0.0/16"

  tags = {
    Name = "Proj-Vpc"
  }
}

resource "aws_internet_gateway" "proj-igw" {
  vpc_id = aws_vpc.proj-vpc.id

  tags = {
    Name = "Proj-IGW"
  }
}

resource "aws_subnet" "proj-subnet" {
  vpc_id     = aws_vpc.proj-vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1a"
  tags = {
    Name = "Proj-Subnet"
  }
}

resource "aws_route_table" "proj-RT" {
  vpc_id = aws_vpc.proj-vpc.id

 route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.proj-igw.id
  }
  tags = {
    Name = "Proj-Route"
  }
}

resource "aws_route_table_association" "proj-rta" {
  subnet_id      = aws_subnet.proj-subnet.id
  route_table_id = aws_route_table.proj-RT.id
}
