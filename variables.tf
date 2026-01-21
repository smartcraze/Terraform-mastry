variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "ec2_name" {
  type    = string
  default = "WebServerInstance"
}
variable "aws_ami_id" {
  type    = string
  default = "ami-019715e0d74f695be"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "instance_root_size" {
  type    = number
  default = 8
}
