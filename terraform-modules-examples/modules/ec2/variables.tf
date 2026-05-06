variable "ami" {
  description = "AMI id for the instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Key pair name (optional)"
  type        = string
  default     = ""
}

variable "security_group_ids" {
  description = "List of security group ids"
  type        = list(string)
  default     = []
}

variable "root_volume_size" {
  description = "Root volume size (GB)"
  type        = number
  default     = 8
}

variable "tags" {
  description = "Map of tags to apply"
  type        = map(string)
  default     = {}
}
