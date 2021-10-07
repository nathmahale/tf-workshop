resource "aws_vpc" "tf_test_vpc" {
  cidr_block           = "10.0.0.0/24"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  instance_tenancy     = "default"

  tags = {
    Name    = "tf_test_vpc"
    Project = var.project_tag
  }
}

resource "aws_subnet" "tf_public_subnet_1" {
  vpc_id                  = aws_vpc.tf-test-vpc.id
  cidr_block              = "10.0.1.0/27"
  map_public_ip_on_launch = "false"
  avalibility_zone        = "ap-southeast-2a"

  tags = {
    Name    = "tf_public_subnet_1"
    Project = var.project_tag
  }

}
