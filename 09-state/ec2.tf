resource "aws_instance" "state_demo" {
  instance_type = "t3.micro"
  ami = data.aws_ami.joindevops.id
  vpc_security_group_ids = [aws_security_group.state_demo.id]

tags = {
    name = "state_demo"
    }
}

resource "aws_security_group" "state_demo" {
    name = "state_demo"

ingress {
    from_port = 0
    to_port = 0
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }

tags = {
    name = "state_demo"
    }

lifecycle {
    create_before_destroy = true
    }
}