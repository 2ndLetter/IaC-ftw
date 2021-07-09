variable "main_region" {
  type    = string
  default = "us-east-1"
}

provider "aws" {
  region = var.main_region
}

data "aws_subnet" "webserver" {
  filter {
    name = "tag:Name"
    values = ["IaC-FTW-webserver"]
  }
}

data "aws_subnet" "consumer" {
  filter {
    name = "tag:Name"
    values = ["IaC-FTW-consumer"]
  }
}

resource "aws_instance" "webserver" {
  ami                         = data.aws_ami.this.id
  subnet_id                   = data.aws_subnet.webserver.id
  instance_type               = "t2.micro"
  associate_public_ip_address = true

  tags = {
    Name = "webserver"
  }
}

resource "aws_instance" "consumer" {
  ami                         = data.aws_ami.this.id
  subnet_id                   = data.aws_subnet.consumer.id
  instance_type               = "t2.micro"
  associate_public_ip_address = true

  tags = {
    Name = "consumer"
  }
}


data "aws_ami" "this" {
  most_recent = true
  owners      = ["self"]

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "name"
    values = ["proving_grounds_*"]
  }
}
