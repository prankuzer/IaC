terraform {
  required_providers {
    aws = ">=4.16"
  }
}

provider "aws" {
  region  = var.region
  profile = var.profile
}

resource "aws_instance" "my_ubuntu" {
  ami           = "ami-06878d265978313ca"
  key_name      = "sergei-northv"
  instance_type = "t2.micro"
  tags = {
    Name    = "My-UbuntuLinux-Server"
    Owner   = "Sergei Epammer"
    project = "Kingsman"
  }
}