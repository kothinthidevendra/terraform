variable "ingress_rules" {
    default = {
        ssh = {
            port = 22
            cidr_blocks = ["0.0.0.0/0"]
            Description = "Allowing port 22 to access ssh"
        },
        mysql = {
            port = 3306
            cidr_blocks = ["0.0.0.0/0"]
            Description = "Allowing port 3306 to access database"
        },
        http = {
            port = 80
            cidr_blocks = ["0.0.0.0/0"]
            Description = "Allowing port 80 to access website"
        },
        tcp = {
            port = 8081
            cidr_blocks = ["0.0.0.0/0"]
            Description = "Allowing port 8081 to access web app"
        }
    }
}