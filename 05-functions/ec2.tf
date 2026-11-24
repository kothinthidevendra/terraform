resource "aws_instance" "functions" {
  instance_type = var.instance_type
  ami = var.image_id
  vpc_security_group_ids = [aws_security_group.functions.id]

tags = merge (
  var.common_tags,
  {
    Name = "functions-demo"
    Component = "poc"
  }
)
} 

resource "aws_security_group" "functions" {
  name = "functions"

ingress {
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}

egress {
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]  
}


tags = merge (
  var.common_tags,
  {
    Name = "functions-sg"
    Component = "poc"
    }
  )
}
