variable "environment" {
  default = "dev"
}

variable "project" {
  default = "roboshop"
}

variable  "image_id" {
  type        = string
  default     = "ami-0055977a6e828a4f4"
  description = "AMI ID of the instance"
}


variable  "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "Instance type of EC2"
}

variable "ec2_tags" {
    type = map
    default = {
        Name = "roboshop-mongodb"
        Environment = "dev"
        Terraform = "true"
        Project = "roboshop"
        Component = "mongodb"
    }
}

variable "cidr" {
    type = list
    default = ["0.0.0.0/0"]
}

variable "from_port" {
    type = number
    default = 0
}

variable "instances" {
  type = list
  #default = ["mongodb", "redis", "mysql", "rabbitmq", "catalogue", "user", "cart", "shipping", "payment", "frontend"]
  default = ["mongodb", "redis", "frontend"]
}

variable "zone_id" {
  default = "Z02693233UPSCMXN63M8"
}

variable "domain_name" {
  default = "joindevops.store"
}