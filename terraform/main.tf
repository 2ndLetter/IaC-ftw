variable "main_region" {
  type    = string
  default = "us-east-1"
}

provider "aws" {
  region = var.main_region
}

module "vpc" {
  source = "./modules/vpc"
  region = var.main_region
}

resource "aws_route" "r" {
  route_table_id         = module.vpc.rt_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = module.vpc.gw_id
}

resource "aws_instance" "my-instance" {
  ami                         = module.vpc.ami_id
  subnet_id                   = module.vpc.subnet_id
  instance_type               = "t2.micro"
  associate_public_ip_address = true

  tags = {
    Name = "IaC-FTW"
  }
}

resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow http inbound traffic"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "allow http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_http"
  }
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow ssh inbound traffic"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "allow ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}