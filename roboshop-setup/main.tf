resource "aws_instance" "app" {
  count                  = length(var.components)
  ami                    = data.aws_ami.ami.image_id
  instance_type          = "t3.micro"
  tags = {
    Name = "${var.components["${count.index}"]}-dev"
  }

  }

resource "aws_route53_record" "record" {
  count   = length(var.components)
  zone_id = "Z041664530K7AC27IQBVL"
  name    = "${var.components["${count.index}"]}-dev"
  type    = "A"
  ttl     = 30
  records = [aws_instance.app.*.private_ip[count.index]]
}