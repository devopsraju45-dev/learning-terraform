resource "aws_instance" "app" {
  count                  = length(var.components)
  ami                    = data.aws_ami.ami.image_id
  instance_type          = "t3.micro"
  tags = {
    Name = "${var.components["${count.index}"]}-dev"
  }

  }