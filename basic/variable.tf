variable "aws_region" {
  description = "AWS region where resources will be provisioned"
  type        = string
  default     = "ap-south-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "aws_ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_root_size" {
  description = "Root volume size in GB"
  type        = number
}

variable "ec2_name" {
  description = "Name tag for the EC2 instance"
  type        = string
}

