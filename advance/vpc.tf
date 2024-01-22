
locals {
  env      = "labnc"
  vpc_name = "labnc"

  region = "ap-southeast-1"

  # subnet calculation
  vpc_cidr = "10.10.0.0/16"
  # public subnet for NAT, IGW, ELB...
  public_subnet_2a = "10.10.0.0/21"
  public_subnet_2b = "10.10.64.0/21"
  public_subnet_2c = "10.10.128.0/21"

  # private subnet for Redis, MSK, PE...
  private_subnet_2a = "10.10.16.0/21"
  private_subnet_2b = "10.10.80.0/21"
  private_subnet_2c = "10.10.144.0/21"

  # data subnet for Databases
  data_subnet_2a = "10.10.24.0/24"
  data_subnet_2b = "10.10.88.0/24"
  data_subnet_2c = "10.10.152.0/24"

  # mnt subnet for Operation purpose
  mnt_subnet_2a = "10.10.56.0/21"
  mnt_subnet_2b = "10.10.120.0/21"
  mnt_subnet_2c = "10.10.184.0/21"
}
resource "aws_vpc" "labnc" {
  cidr_block = local.vpc_cidr
  tags = {
    "Name"      = local.vpc_name
    Environment = local.env
  }
}

resource "aws_internet_gateway" "labnc" {
  vpc_id = aws_vpc.labnc.id
  tags = {
    "Name"      = "labnc_igw"
    Environment = local.env
  }
}

resource "aws_eip" "labnc" {
  vpc = true
  tags = {
    "Name"      = "labnc_eip"
    Environment = local.env
  }
}

resource "aws_nat_gateway" "labnc" {
  allocation_id = aws_eip.labnc.id
  subnet_id     = aws_subnet.public_subnet_2a.id
  tags = {
    "Name"      = "labnc_nat_gw"
    Environment = local.env
  }
  depends_on = [aws_internet_gateway.labnc]
}

