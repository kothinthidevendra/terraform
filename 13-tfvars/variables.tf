variable "instance_type" {
    type = string
}

variable "environment" {
    type = string
}

variable "ec2_tags" {
    type = map
    default = {
        Name = "roboshop-workspaces-demo"
        Terraform = "true"
        Project = "roboshop"
    }
}

variable "cidr" {
    default = ["0.0.0.0/0"]
}

variable "from_port" {
    default = 0
}

variable "to_port" {
    default = 0
}