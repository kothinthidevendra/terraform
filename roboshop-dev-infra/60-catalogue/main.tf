resource "aws_instance" "catalogue" {
  instance_type = "t3.micro"
  ami = local.ami_id
  subnet_id = local.private_subnet_id
  vpc_security_group_ids = [local.catalogue_sg_id]
  tags = local.common_tags
}

resource "terraform_data" "bootstrap" {
  triggers_replace = [
    aws_instance.catalogue.id
  ]

  connection {
    type = "ssh"
    user = "ec2-user"
    password = "DevOps321"
    host = aws_instance.catalogue.private_ip
  }

  provisioner "file" {
    source = "${path.module}/bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/bootstrap.sh",
      "sudo sh /tmp/bootstrap.sh catalogue ${var.environment} ${var.app_version}"
    ]
  }
}

resource "aws_ec2_instance_state" "catalogue" {
  instance_id = aws_instance.catalogue.id
  state       = "stopped"
  depends_on = [terraform_data.bootstrap]
}

resource "aws_ami_from_instance" "catalogue" {
  name                = "${local.common_tags.Name}-${var.app_version}-${aws_instance.catalogue.id}"
  source_instance_id = aws_instance.catalogue.id
  
  depends_on = [aws_ec2_instance_state.catalogue]

  tags = merge(
    local.common_tags,
    {
      Name = "${local.common_tags.Name}-${var.app_version}-${aws_instance.catalogue.id}"
    }
  )
  }

resource "aws_launch_template" "catalogue" {
  name = local.common_tags.Name
  image_id = aws_ami_from_instance.catalogue.id
  instance_initiated_shutdown_behavior = "terminate"
  instance_type = "t3.micro"
  vpc_security_group_ids = [local.catalogue_sg_id]
  update_default_version = true

  tag_specifications {
    resource_type = "instance"

    tags = local.common_tags,
    {
      Name = local.common_tags.Name
    }
  }

  tag_specifications {
    resource_type = "volume"

    tags = local.common_tags,
    {
      Name = local.common_tags.Name
    }
  }
}

