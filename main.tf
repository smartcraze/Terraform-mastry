
/*
 resource "aws_instance" "app_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  tags = {
    Name = "learn-terraform"
  }
}
 */


/* 
resource "aws_s3_bucket" "my_bucket" {
  bucket = "cws-terraform-example-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
} */
