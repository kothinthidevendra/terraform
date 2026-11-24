resource "aws_security_group" "dynamic" {
    name = "dynamic-demo"

dynamic "ingress"  { # terraform will give block name as special variable
  for_each = var.ingress_rules
  content {
    from_port = ingress.value.port
    to_port = ingress.value.port
    protocol = "tcp"
    cidr_blocks = ingress.value.cidr_blocks
        }

    }

tags = {
    Name = "dynamic-demo"
 }
}