resource "aws_vpc" "hope_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "hope-pub-1" {
  vpc_id     = aws_vpc.hope_vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = var.ZONE1

  tags = {
    Name = "hope-pub-1"
  }
}
resource "aws_subnet" "hope-pub-2" {
  vpc_id     = aws_vpc.hope_vpc.id
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = var.ZONE2

  tags = {
    Name = "hope-pub-2"
  }
}
resource "aws_subnet" "hope-pub-3" {
  vpc_id     = aws_vpc.hope_vpc.id
  cidr_block = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = var.ZONE3

  tags = {
    Name = "hope-pub-3"
  }
}
resource "aws_subnet" "hope-priv-1" {
  vpc_id     = aws_vpc.hope_vpc.id
  cidr_block = "10.0.4.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = var.ZONE1

  tags = {
    Name = "hope-priv-1"
  }
}
resource "aws_subnet" "hope-priv-2" {
  vpc_id     = aws_vpc.hope_vpc.id
  cidr_block = "10.0.5.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = var.ZONE2

  tags = {
    Name = "hope-priv-2"
  }
}
resource "aws_subnet" "hope-priv-3" {
  vpc_id     = aws_vpc.hope_vpc.id
  cidr_block = "10.0.6.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = var.ZONE3

  tags = {
    Name = "hope-priv-3"
  }
}

resource "aws_internet_gateway" "hope-IGW" {
  vpc_id = aws_vpc.hope_vpc.id

  tags = {
    Name = "hope-IGW"
  }
}

resource "aws_route_table" "hope-pub-RT" {
  vpc_id = aws_vpc.hope_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.hope-IGW.id
  }

  tags = {
    Name = "hope-pub-RT"
  }
}

resource "aws_route_table_association" "hope-pub-1-a" {
  subnet_id      = aws_subnet.hope-pub-1.id
  route_table_id = aws_route_table.hope-pub-RT.id
}

resource "aws_route_table_association" "hope-pub-2-a" {
  subnet_id      = aws_subnet.hope-pub-2.id
  route_table_id = aws_route_table.hope-pub-RT.id
}

resource "aws_route_table_association" "hope-pub-3-a" {
  subnet_id      = aws_subnet.hope-pub-3.id
  route_table_id = aws_route_table.hope-pub-RT.id
}


locals {
  public_subnets = [
    aws_subnet.hope-pub-1.id,
    aws_subnet.hope-pub-2.id,
    aws_subnet.hope-pub-3.id
    // dont use hope-priv-1 to 3, because when we use it in our lb subnets, elb expects each subnets to be in diff az, so since
    // hope-priv-1 to 3 have the same zone with pub 1 to pub3.  
  ]
}