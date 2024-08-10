resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id
}

resource "aws_subnet" "public-eu-west-1a" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.0.0/18"
    availability_zone = "eu-west-1a"
}

resource "aws_subnet" "public-eu-west-1b" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.64.0/18"
    availability_zone = "eu-west-1b"
}

resource "aws_route_table" "public" {
    vpc_id = aws_vpc.main.id
    route = [
    {
      cidr_block                 = "0.0.0.0/0"
      gateway_id                 = aws_internet_gateway.igw.id
      nat_gateway_id             = ""
      carrier_gateway_id         = ""
      destination_prefix_list_id = ""
      egress_only_gateway_id     = ""
      instance_id                = ""
      ipv6_cidr_block            = ""
      local_gateway_id           = ""
      network_interface_id       = ""
      transit_gateway_id         = ""
      vpc_endpoint_id            = ""
      vpc_peering_connection_id  = ""
    },
  ]
}

resource "aws_route_table_association" "public-eu-west-1a" {
    subnet_id = aws_subnet.public-eu-west-1a.id
    route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public-eu-west-1b" {
    subnet_id = aws_subnet.public-eu-west-1b.id
    route_table_id = aws_route_table.public.id
}