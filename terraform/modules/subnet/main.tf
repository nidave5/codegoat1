resource "aws_subnet" "primary" {
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr_primary
  availability_zone = "${var.region}a"
  tags = {
    yor_trace = "ff6a9092-b7ea-4006-b273-ef9e9db21c8e"
  }
}

resource "aws_subnet" "secondary" {
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr_secondary
  availability_zone = "${var.region}c"
  tags = {
    yor_trace = "d254578f-19bd-4a91-a46f-56bd4dfb2f8d"
  }
}
