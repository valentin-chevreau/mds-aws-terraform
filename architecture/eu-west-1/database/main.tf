provider "aws" {
  region     = "eu-west-1"
  version    = "~>2.11.0"
}
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
  tags = {
      Name = "Ami"
  }
}

resource "aws_instance" "bastion" {
  ami           = "${data.aws_ami.ubuntu.id}"
  availability_zone = "eu-west-1a"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.subnet-uno.id}"
  tags = {
    Name = "Bastion"
  }
}


resource "aws_instance" "web" {
  ami           = "${data.aws_ami.ubuntu.id}"
  availability_zone = "eu-west-1b"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.ingress-all-test.id}"]
  subnet_id = "${aws_subnet.subnet-two.id}"
  # key_name = "test-mds"
  tags = {
    Name = "Web instance with EC2 Db connection"
  }
}

resource "aws_db_instance" "default" {
  availability_zone = "eu-west-1b"
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "9.6.3"
  instance_class       = "db.t2.micro"
  name                 = "mds_aws_postgre"
  username             = "vchevreau"
  password             = "2019!mds_vchevreau&Test"
  # parameter_group_name = "default.mysql5.7"
  db_subnet_group_name = "${aws_db_subnet_group.default.id}"
  skip_final_snapshot = true
  tags = {
    Name = "DB instance"
  }
}