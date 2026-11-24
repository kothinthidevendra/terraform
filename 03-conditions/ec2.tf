resource "aws_instance" "web" {
  instance_type = var.environment == "dev" ? "t3.micro" : "t3.medium"
  ami = var.image_id
  vpc_security_group_ids = [aws_security_group.web.id]

tags = {
  name = "roboshop-web"
}
}

resource "aws_security_group" "web" {
  name = "web"
  description = "allows traffic for web server"

ingress {
  from_port = var.from_port
  to_port = 0
  protocol = "-1"
  cidr_blocks = var.cidr
}

egress {
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}

tags = {
  name = "roboshop-web"
 }
}