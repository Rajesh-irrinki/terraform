variable "project_tags" {
    default = {
        Name = "provisoner-demo"
        Environment = "Dev"
        Project = "Roboshop"
    }
}

variable "ingress_rules" {
    default = [
   {
     from_port = 0
     to_port = 0
     protocol = "-1"
     cidr_blocks = ["0.0.0.0/0"]
   },
   {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
   },
   {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
   } 
     ]
}

variable "password" {
  type = string
}