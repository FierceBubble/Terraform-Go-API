terraform {
  required_version = ">= 0.13.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 0.56.0"
    }
  }
}

provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_instance" "aws_instance" {
  ami = "ami-0df7a207adb9748c7" # Ubuntu 22.04 LTS

  instance_type = "t2.micro"
  tags = {
    Name = "terraform-deploy"
  }
}
