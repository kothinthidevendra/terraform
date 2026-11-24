variable "environment" {
    default = "dev"
}

variable "project" {
    default = "roboshop"
}

variable "ami_id" {
    type = string
    default = "ami-0055977a6e828a4f4"
}

variable "instance_type" {
    default = "t3.micro"
}

variable "instances" {
    type = map
    default = {
        mongodb = {
            instance_type = "t3.small"
            port_no = 27017
        },
        redis = {
            instance_type = "t3.micro"
            port_no = 6379
        },
        mysql = {
            instance_type = "t3.medium"
            port_no = 3306
        }
    }
}

variable "zone_id" {
  default = "Z02693233UPSCMXN63M8"
}

variable "domain_name" {
  default = "joindevops.store"
}

