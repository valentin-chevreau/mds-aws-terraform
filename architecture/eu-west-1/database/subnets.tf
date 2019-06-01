resource "aws_subnet" "subnet-uno" {
  cidr_block = "10.0.1.0/24"
  
  vpc_id = "${aws_vpc.test-env.id}"
  availability_zone = "eu-west-1a"
  
  tags = {
    Name = "First subnet"
  }
}

resource "aws_subnet" "subnet-two" {
  cidr_block = "10.0.2.0/24"
  
  vpc_id = "${aws_vpc.test-env.id}"
  availability_zone = "eu-west-1b"
  
  tags = {
    Name = "Second subnet"
  }
}