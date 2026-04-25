/*resource "aws_vpc" "test_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "test_vpc"
  }

}
resource "aws_subnet" "test_subnet_1" {
  count      = length(var.subnet)
  vpc_id     = aws_vpc.test_vpc.id
  cidr_block = var.subnet[count.index]
  availability_zone = element(["us-east-1a", "us-east-1b"], count.index)
  tags = {
    Name = "Private-subnet-${count.index + 1}"
  }
}
https://awscli.amazonaws.com/AWSCLIV2.msi
*/
###############