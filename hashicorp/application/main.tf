variable "main_region" {
  type    = string
  default = "us-east-1"
}

provider "aws" {
  region = var.main_region
}

data "aws_subnet" "webserver" {
  filter {
    name   = "tag:Name"
    values = ["IaC-FTW-webserver"]
  }
}

data "aws_subnet" "consumer" {
  filter {
    name   = "tag:Name"
    values = ["IaC-FTW-consumer"]
  }
}

data "aws_security_group" "http" {
  name   = "allow_http"
}

data "aws_security_group" "ssh" {
  name   = "allow_ssh"
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

resource "aws_launch_configuration" "webserver" {
  name          = "webserver"
  image_id      = data.aws_ami.this.id
  instance_type = "t2.micro"
  iam_instance_profile = "web_server"
  user_data     = "${file("scripts/webserver_userdata.sh")}"
}

resource "aws_autoscaling_group" "webserver" {
    name     = "webserver"
    max_size    = 1
    min_size    = 1
    launch_configuration    = aws_launch_configuration.webserver.name
    vpc_zone_identifier      = [data.aws_subnet.webserver.id]

      tag {
      key    = "Name"
      value    = "webserver"
      propagate_at_launch = true
  }
} 

resource "aws_launch_configuration" "consumer" {
  name          = "consumer"
  image_id      = data.aws_ami.this.id
  instance_type = "t2.micro"
  iam_instance_profile = "web_server"
  user_data     = "${file("scripts/consumer_userdata.sh")}"
}

resource "aws_autoscaling_group" "consumer" {
    name     = "consumer"
    max_size    = 1
    min_size    = 1
    launch_configuration    = aws_launch_configuration.consumer.name
    vpc_zone_identifier      = [data.aws_subnet.consumer.id]

      tag {
      key    = "Name"
      value    = "consumer"
      propagate_at_launch = true
  }
}