resource "aws_internet_gateway" "test_igw" {
  vpc_id = aws_vpc.tf_test_vpc.id

  tags = {
    Name    = "tf-test-igw"
    Project = var.project_name
  }
}

resource "aws_route_table" "tf_custom_rt" {
  vpc_id = aws_vpc.tf_test_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test_igw.id
  }
  tags = {
    Name    = "tf-test-pulic-crt"
    Project = var.project_name
  }
}

resource "aws_route_table_association" "tf_route_table_public_subnet" {
  subnet_id      = aws_subnet.tf_public_subnet.id
  route_table_id = aws_route_table.tf_custom_rt.id
}
