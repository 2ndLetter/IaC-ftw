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
  route_table_id            = module.vpc.rt_id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = module.vpc.gw_id
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