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

resource "aws_iam_role" "web_server" {
  name = "web_server"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  inline_policy {
    name = "inline_policy_write"

    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Action   = ["ec2:*", "s3:P*", "s3:L*",]
          Effect   = "Allow"
          Resource = "*"
        }
      ]
    })
  }

  tags = {
    tag-key = "web_server"
  }
}

resource "aws_iam_instance_profile" "web_server" {
  name = "web_server"
  role = aws_iam_role.web_server.name
}

resource "aws_iam_role" "consumer" {
  name = "consumer"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  inline_policy {
    name = "inline_policy_read"

    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Action   = ["s3:G*", "s3:L*"]
          Effect   = "Allow"
          Resource = "*"
        }
      ]
    })
  }

  tags = {
    tag-key = "consumer"
  }
}

resource "aws_iam_instance_profile" "consumer" {
  name = "consumer"
  role = aws_iam_role.consumer.name
}

resource "aws_s3_bucket" "b" {
  bucket = var.bucket_name
  acl    = "private"
}

resource "aws_s3_bucket_policy" "b" {
  bucket = aws_s3_bucket.b.id

  # Terraform's "jsonencode" function converts a
  # Terraform expression's result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Id      = "MYBUCKETPOLICY"
    Statement = [
      {
        Sid       = "consumer_read"
        Effect    = "Allow"
        Principal = {
          "AWS": "${aws_iam_role.consumer.arn}"
        }
        Action    = ["s3:G*", "s3:L*"]
        Resource = [
          aws_s3_bucket.b.arn,
          "${aws_s3_bucket.b.arn}/*",
        ]
      },
      {
        Sid       = "webserver_write"
        Effect    = "Allow"
        Principal = {
          "AWS": "${aws_iam_role.web_server.arn}"
        }
        Action    = ["s3:P*", "s3:L*"]
        Resource = [
          aws_s3_bucket.b.arn,
          "${aws_s3_bucket.b.arn}/*",
        ]
      },
    ]
  })
}