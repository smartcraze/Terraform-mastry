# key pair for EC2 instance

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("terra-ec2-key.pub")
}

## default VPC 

resource "aws_default_vpc" "default" {
  tags = {
    Name = "default-vpc"
  }
}

## security groups for ec2 instance

resource "aws_security_group" "my_security_group" {
  name        = "automation-allow-tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_default_vpc.default.id

  # inbound rule 
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow inbound HTTPS traffic"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow inbound SSH traffic"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow inbound HTTP traffic"
  }
  egress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  # outbound rule

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # all protocols
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = {
    Name = "automation-allow-tls"
  }
}


# EC2 instance

resource "aws_instance" "web_server" {
  key_name        = aws_key_pair.deployer.key_name
  security_groups = [aws_security_group.my_security_group.name]
  instance_type   = "t2.micro"
  ami             = "ami-019715e0d74f695be"

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
  }

  tags = {
    Name = "WebServerInstance"
  }
}




