terraform {
  required_providers {
    aws = ">=4.16"
  }
}

provider "aws" {
  region  = var.region
  profile = var.profile
}

resource "aws_default_vpc" "default" {}

resource "aws_default_security_group" "default" {
  vpc_id = aws_default_vpc.default.id

  ingress {
    description = "Allow port HTTPS"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow port HTTPS"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow ALL ports"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_instance" "my_ubuntu" {
  ami                    = "ami-06878d265978313ca"
  key_name               = "sergei-northv"
  instance_type          = "t2.micro"
  availability_zone      = data.aws_availability_zones.available.names[0]
  vpc_security_group_ids = [aws_default_security_group.default.id]
  tags = {
    Name    = "My-UbuntuLinux-Server"
    Owner   = "Sergei Epammer"
    project = "Kingsman"
  }
}

resource "aws_instance" "my_amazon" {
  ami                    = "ami-0b5eea76982371e91"
  instance_type          = "t2.micro"
  key_name               = "sergei-northv"
  availability_zone      = data.aws_availability_zones.available.names[1]
  vpc_security_group_ids = [aws_default_security_group.default.id]

  tags = {
    Name  = "My-AmazonLinux-Server"
    Owner = "Sergei Epammer"
  }
}
