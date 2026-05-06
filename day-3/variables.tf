variable "prefix" {
    description = "Prefix for resource names"
    type        = string
    default     = "surajv.dev"
  
}
# S3 bucket variables

variable "bucket_name" {
  description = "bucket name"
  type = string
  default = "bucket-1-surajv-dev"

}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "aws_regions" {
  description = "aws regions"
  type = string
  default = "ap-south-1"
}


# EC2 instance variables

variable "instance_type" {
  description = "type of the instance"
  type = string
  default = "t3.micro"
}

variable "aws_ami_id" {
  description = "ami id for the instance"
  type = string
  default = "ami-07a00cf47dbbc844c"
}



variable "instance_root_size" {
  description = "root volume size for the instance"
  type = number
  default = 8 
}

variable "ec2_name" {
  description = "Name tag for the EC2 instance"
  type = string
  default = "web-server"
}

variable "ec2_security_groups_names" {
  description = "List of security groups for the EC2 instance"
  type = list(string)
  default = ["default"] 
}

