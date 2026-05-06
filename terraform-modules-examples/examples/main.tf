terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.43.0"
    }
  }
}


provider "aws" {
  region = var.aws_region
}

# Lookup latest Ubuntu 22.04 AMI (Canonical)
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

resource "random_string" "bucket_suffix" {
  length  = 4
  upper   = false
  special = false
}

module "ec2_demo" {
  source            = "../modules/ec2"
  ami               = data.aws_ami.ubuntu.id
  instance_type     = "t3.micro"
  key_name          = "" # set if available
  security_group_ids = []
  root_volume_size  = 8
  tags = {
    Name        = "demo-ec2"
    Environment = "dev"
  }
}


module "ec2_demo-1" {
  source            = "../modules/ec2"
  ami               = data.aws_ami.ubuntu.id
  instance_type     = "t3.micro"
  key_name          = "" # set if available
  security_group_ids = []
  root_volume_size  = 8
  tags = {
    Name        = "demo-ec2-1"
    Environment = "prod"
  }
}

module "s3_demo" {
  source     = "../modules/s3"
  bucket     = "demo-module-bucket-${random_string.bucket_suffix.result}"
  tags = {
    Name        = "demo-s3"
    Environment = "dev"
  }
}

output "ec2_id" {
  value = module.ec2_demo-1.id
}

output "ec2_public_ip" {
  value = module.ec2_demo-1.public_ip
}

output "s3_bucket" {
  value = module.s3_demo.bucket
}
