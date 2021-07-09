variable "main_region" {
  type    = string
  default = "us-east-1"
}

provider "aws" {
  region = var.main_region
}

resource "aws_instance" "webserver" {
  ami                         = data.aws_ami.this.id
  subnet_id                   = module.vpc.subnet_id_webserver
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.allow_ssh.id]

  tags = {
    Name = "webserver"
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

data "aws_s3_bucket_object" "subnet_id_webserver"