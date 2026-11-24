resource "aws_instance" "provisioner" {
  instance_type = "t3.micro"
  ami = "ami-0055977a6e828a4f4"
  vpc_security_group_ids = [aws_security_group.provisioner.id]

provisioner "local-exec" {
  command = "echo private ip is ${self.private_ip} > inventory.ini"
}

provisioner "local-exec" {
  when = destroy
  command = "echo 'Instance is going to destroyed'"
}

connection {
  type = "ssh"
  user = "ec2-user"
  password = "DevOps321"
  host = self.public_ip
}

# provisioner "remote-exec" {
#   inline = [
#     "sudo dnf install nginx -y",
#     "sudo systemctl start nginx",
#     "sudo systemctl enable nginx"
#   ]
# }

provisioner "file" {
  source      = "bootstrap.sh"
  destination = "/tmp/bootstrap.sh"
}

provisioner "remote-exec" {
  inline = [
    "chmod +x /tmp/bootstrap.sh",
    "sudo /tmp/bootstrap.sh"
  ]
}

}

resource "aws_security_group" "provisioner" {
  name        = "provisioner"
  description = "Allow TLS inbound traffic and all outbound traffic"

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "roboshop-provisioner"
  }
 }
