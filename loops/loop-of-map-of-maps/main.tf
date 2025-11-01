resource "aws_instance" "web" {
  for_each      = var.sample
  ami           = "ami-005d1c2f7f99cdb06"
  instance_type = each.value["type"]
  tags = {
    Name = each.value["name"]
  }
}

variable "sample" {
  default = {
    one = {
      type = "t3.micro"
      name = "one"
    }
    two = {
      type = "t3.medium"
      name = "two"
    }
  }
}