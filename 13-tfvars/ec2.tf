resource "aws_instance" "tfvars_demo" {
  instance_type = var.instance_type
  ami = data.aws_ami.joindevops.id
  vpc_security_group_ids = [aws_security_group.tfvars_demo.id]

  tags = {
    Name = "roboshop-tfvars_demo-${var.environment}"
  }
}

resource "aws_security_group" "tfvars_demo" {
  name = "roboshop-tfvars_demo-${var.environment}"

  ingress {
    from_port = var.from_port
    to_port =  var.to_port
    protocol = "tcp"
    cidr_blocks = var.cidr
  }

  tags = {
    Name = "roboshop-tfvars_demo-${var.environment}"
  }

  lifecycle {
    create_before_destroy = "true"
  }

}


