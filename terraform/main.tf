terraform {
  required_providers {
    aws = ">=4.16"
  }
}

provider "aws" {
  region  = var.region
  profile = var.profile
}
