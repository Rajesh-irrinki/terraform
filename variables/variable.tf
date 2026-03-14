variable "ami_id" {
    type = string
    default = "ami-0220d79f3f480ecf5"
    description = "AMI address for creating EC2 instance"
} 

variable "instance_type" {
    type = string
    default = "t3.micro"
}

variable "Environment" {
    type = string
    default = "dev"
}

variable "instance_name" {
    type = string
    default = "roboshop-tf"
}

variable "sg_name" {
    type = string
    default = "allow-all-sg-tf"
    description = "this variable will store the security group name"
}

variable "from_port" {
    type = number
    default = 0
}

variable "to_port" {
    type = number
    default = 0
}

variable "protocol" {
    type = string
    default = "-1"
}

variable "cidr_blocks" {
    type = list
    default = ["0.0.0.0/0"]
}

variable "ipv6_cidr_blocks" {
    type = list
    default = ["::/0"]
  
}

variable "sg_tags" {
    type = map 
    default = {
        Name = "allow-all-sg-tf"
        Project = "roboshop-tf"
        Environment = "dev"
    }
}

variable "ec2_tags" {
    type = map
    default = {
        Name = "roboshop-tf"
        Project = "roboshop"
    }
}