terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

module "server-generator" {
  source            = "../../modules"
  ami               = data.aws_ami.ubuntu.id
  availability-zone = var.az2
  //security-group    = module.server-generator.ubuntu-sg-output
  security-group = aws_security_group.ubuntu-sg.id
  role           = var.role2
  name           = var.name2
  purpose        = var.purpose2
  index          = var.index2
}