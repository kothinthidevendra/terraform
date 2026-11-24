variable "image_id" {
  type = string
  default = "ami-0055977a6e828a4f4"
}

variable "instance_type" {
  type = string
  default = "t3.micro"
}

variable "from_port" {
  type = number
  default = 0
}

variable "cidr" {
  type = list
  default = ["0.0.0.0/0"]
}
  
variable "environment" {
  default = "prod"
}