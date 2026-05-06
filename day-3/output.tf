output "s3-bucket-name" {
  value = aws_s3_bucket.surajv_dev_s3_bucket.bucket
  description = "Name of the S3 bucket created by Terraform"
}

output "s3_bucket_id" {
  value = aws_s3_bucket.surajv_dev_s3_bucket.id
  description = "ID of the S3 bucket created by Terraform"
}


output "ec2_instance_ipv4" {
  value = aws_instance.web_server.public_ip
  description = "Public IP address of the EC2 instance created by Terraform"
}

output "ec2_instance_id" {
  value = aws_instance.web_server.id
  description = "ID of the EC2 instance created by Terraform"
}

output "ec2_instance_arn" {
  value = aws_instance.web_server.arn
  description = "ARN of the EC2 instance created by Terraform"
}

output "ec2_instance_ipv6" {
  value = aws_instance.web_server.ipv6_addresses
  description = "IPv6 addresses of the EC2 instance created by Terraform"
}


output "instance_public_ip" {
  value = aws_instance.web_server.public_ip
  description = "Public IP address of the EC2 instance created by Terraform"
}

output "instance_public_dns" {
  value = aws_instance.web_server.public_dns
  description = "Public DNS name of the EC2 instance created by Terraform"
}


output "ssh_command" {
  value = "ssh -i 'ec2-ssh-key' ubuntu@${aws_instance.web_server.public_dns}"
}


















