data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_vpc" "default" {
  default = true
}

# Reference the ID in other resources or outputs
output "default_vpc_id" {
  value = data.aws_vpc.default.id
} 