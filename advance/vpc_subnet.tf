################################
# Public subnets
################################

resource "aws_subnet" "public_subnet_2a" {
  vpc_id                  = aws_vpc.labnc.id
  cidr_block              = local.public_subnet_2a
  availability_zone       = "${local.region}a"
  map_public_ip_on_launch = true
  tags = {
    "Name"      = "${local.vpc_name}_public_2a"
    Environment = local.env
    scope       = "public"
  }
  depends_on = [aws_vpc.labnc]
}

resource "aws_subnet" "public_subnet_2b" {
  vpc_id                  = aws_vpc.labnc.id
  cidr_block              = local.public_subnet_2b
  availability_zone       = "${local.region}b"
  map_public_ip_on_launch = true
  tags = {
    "Name"      = "${local.vpc_name}_public_2b"
    Environment = local.env
    scope       = "public"
  }
  depends_on = [aws_vpc.labnc]
}

resource "aws_subnet" "public_subnet_2c" {
  vpc_id                  = aws_vpc.labnc.id
  cidr_block              = local.public_subnet_2c
  availability_zone       = "${local.region}c"
  map_public_ip_on_launch = true
  tags = {
    "Name"      = "${local.vpc_name}_public_2c"
    Environment = local.env
    scope       = "public"
  }
  depends_on = [aws_vpc.labnc]
}

################################
# Private subnets
################################

resource "aws_subnet" "private_subnet_2a" {
  vpc_id            = aws_vpc.labnc.id
  cidr_block        = local.private_subnet_2a
  availability_zone = "${local.region}a"
  tags = {
    "Name"      = "${local.vpc_name}_private_2a"
    Environment = local.env
    scope       = "private"
  }
  depends_on = [aws_vpc.labnc]
}

resource "aws_subnet" "private_subnet_2b" {
  vpc_id            = aws_vpc.labnc.id
  cidr_block        = local.private_subnet_2b
  availability_zone = "${local.region}b"
  tags = {
    "Name"      = "${local.vpc_name}_private_2b"
    Environment = local.env
    scope       = "private"
  }
  depends_on = [aws_vpc.labnc]
}
resource "aws_subnet" "private_subnet_2c" {
  vpc_id            = aws_vpc.labnc.id
  cidr_block        = local.private_subnet_2c
  availability_zone = "${local.region}c"
  tags = {
    "Name"      = "${local.vpc_name}_private_2c"
    Environment = local.env
    scope       = "private"
  }
  depends_on = [aws_vpc.labnc]
}


#TODO create data tier vs transit tier
