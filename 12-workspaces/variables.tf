variable "instance_type" {
    default = {
        dev = "t3.micro"
        stg = "t3.small"
        prod = "t3.medium"
    }
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