resource "aws_instance" "awsnew" {
  count=2
  ami = "ami-005d1c2f7f99cdb06"
  instance_type = "t3.micro"
}