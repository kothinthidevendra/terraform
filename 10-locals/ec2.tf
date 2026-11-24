resource "aws_instance" "locals_demo" {
  instance_type = local.instance_type
  ami = var.ami_id
  vpc_security_group_ids = [aws_security_group.locals_demo.id]

tags = local.ec2_tags

}

resource "aws_security_group" "locals_demo" {
  name = "locals_demo"

ingress {
  from_port = var.from_port
  to_port = 0
  protocol = "-1"
  cidr_blocks = var.cidr
}

egress {
 from_port = var.from_port
 to_port = 0
 protocol = "-1"
 cidr_blocks = var.cidr

}

tags = {
  Name = "roboshop-locals_demo"
  }
}

