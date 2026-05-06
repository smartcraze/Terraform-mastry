output "id" {
  description = "EC2 instance id"
  value       = aws_instance.this.id
}

output "public_ip" {
  description = "Public IPv4 address"
  value       = aws_instance.this.public_ip
}

output "public_dns" {
  description = "Public DNS name"
  value       = aws_instance.this.public_dns
}
