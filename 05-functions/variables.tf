variable "instance_type" {
    type = string
    default = "t3.micro"
}

variable "image_id" {
    type = string
    default = "ami-0055977a6e828a4f4"
}

variable "common_tags" {
    default = {
        Project = "roboshop"
        Environment = "dev"
        Terraform = "true"
    }
}