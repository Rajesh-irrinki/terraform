variable "ami_id" {
    type = string
    default = "ami-0220d79f3f480ecf5"
}

variable "instance_type" {
    type = string
    default = "t3.micro"
}

variable "zone_id" {
    type = string
    default = "Z04304691CJEXLOI5ZISX"
}

variable "tags" {
    type = map
    default = {
        Name = "roboshop-tf"
        Project = "Roboshop"
        Environment = "dev"
    }
}

variable "port_number" {
    type = number
    default = 0
}

variable "cidr_blocks" {
    type = list
    default = ["0.0.0.0/0"]
}
variable "terraform" {
    type = bool
    default = true
}