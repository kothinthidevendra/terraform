resource "aws_instance" "data_source" {
  instance_type = "t3.micro"
  ami = data.aws_ami.joindevops.id
  vpc_security_group_ids = [aws_security_group.data_source.id]

tags = {
    name = "data_source"
    }
}

resource "aws_security_group" "data_source" {
  name = "data_source"

ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    }
}
