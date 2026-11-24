module "ec2" {
    source = "../terraform-aws-instance" 
    project = "roboshop"
    environment = "dev"
    component = "mongodb" 
    sg_ids = ["sg-03f591775b44e39ea"]
}