resource "aws_instance" "aws" {
  ami = "ami-005d1c2f7f99cdb06"
  instance_type = "t3.micro"
  tags = {
    Name = "MyWebServer"
  }
}