resource "aws_instance" "web" {
  ami                    = "ami-005d1c2f7f99cdb06"
  instance_type          = "t3.micro"
  vpc_security_group_ids = ["sg-066b6d4e7cd0c135f"]
}

resource "null_resource" "cli" {
  triggers = {
    abc = timestamp()
  }
  provisioner "remote-exec" {

    connection {
      host     = aws_instance.web.public_ip
      user     = "root"
      password = "DevOps321"
    }

    inline = [
      "echo Hello Galaxy"
    ]

  }
}