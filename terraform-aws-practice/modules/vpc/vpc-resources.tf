
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "${var.prefix}-vpc"
  }
}
locals {
  subnet_count = min(2, 3, 4)
}

resource "aws_subnet" "subnets" {
    count = local.subnet_count
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, count.index)
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
  tags = {
    Name = "${var.prefix}-subnet-${count.index}"
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "additional_subnets" {
  count = 2
  vpc_id = aws_vpc.main.id
  cidr_block = cidrsubnet(var.vpc_cidr, 8, count.index + 3)
  availability_zone = element(data.aws_availability_zones.available.names, count.index + 3)
  tags = {
    Name = "${var.prefix}-additional-subnet-${count.index}"
  }
}