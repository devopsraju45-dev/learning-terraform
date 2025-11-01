resource "aws_security_group" "web" {
  name        = "web"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = "vpc-09af6f7de90a9d539"

  tags = {
    Name = "web"
  }
}

# Allow inbound HTTPS from anywhere
resource "aws_vpc_security_group_ingress_rule" "web1_ipv4_https" {
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "web1_ipv4_http" {
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}



# Allow all outbound traffic
resource "aws_vpc_security_group_egress_rule" "web_ipv4" {
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

output "sgid" {
value = aws_security_group.web.id
}