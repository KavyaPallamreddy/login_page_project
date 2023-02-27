# Resource Block
# Resource-1: Create VPC
resource "aws_vpc" "vpc-dev" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "vpc-jenkins"
  }
}


#Resource-2: Create Subnets
resource "aws_subnet" "vpc-dev-public-subnet-1" {
    vpc_id = aws_vpc.vpc-dev.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "us-west-2c"
    map_public_ip_on_launch = true
}

#Resource-3: Internet Gateway
resource "aws_internet_gateway" "vpc-dev-igw" {
    vpc_id = aws_vpc.vpc-dev.id
}

#Resource-4: Create Route Table
resource "aws_route_table" "vpc-dev-pubilc-route-table" {
    vpc_id = aws_vpc.vpc-dev.id
}

#Resource-5: Create Route in Route Table for Internet Access
resource "aws_route" "vpc-dev-pubilc-route" {
    route_table_id = aws_route_table.vpc-dev-pubilc-route-table.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc-dev-igw.id
}

#Resource-6: Associate the Route Table with the subnet
resource "aws_route_table_association" "vpc-dev-public-route-table-associate" {
    route_table_id = aws_route_table.vpc-dev-pubilc-route-table.id
    subnet_id = aws_subnet.vpc-dev-public-subnet-1.id
}