resource "aws_instance" "workspaces_demo" {
  instance_type = lookup(var.instance_type, terraform.workspace)
  ami = data.aws_ami.joindevops.id
  vpc_security_group_ids = [aws_security_group.workspaces_demo.id]

  tags = var.ec2_tags
}

resource "aws_security_group" "workspaces_demo" {
  name = "roboshop-workspaces_demo-${terraform.workspace}"

  ingress {
    from_port = var.from_port
    to_port =  var.to_port
    protocol = "tcp"
    cidr_blocks = var.cidr
  }

  tags = {
    Name = "roboshop-workspaces_demo-${terraform.workspace}"
  }

  lifecycle {
    create_before_destroy = "true"
  }

}


