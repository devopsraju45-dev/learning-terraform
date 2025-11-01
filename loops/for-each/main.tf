resource "aws_instance" "web" {
  for_each      = var.sample
  ami           = "ami-005d1c2f7f99cdb06"
  instance_type = each.value
  tags = {
    Name = each.key
  }
}

variable "sample" {
  default = {
    default = ["one", "two"]
  }
}