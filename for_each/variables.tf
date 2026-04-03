variable "ami_id" {
  type = string
  default = "ami-0220d79f3f480ecf5"
}

variable "instance_type" {
    type = string
    default = "t3.micro"
}

variable "Environment" {
    type = string
    default = "dev"
}

variable zone_id {
    type = string
    default = "Z04304691CJEXLOI5ZISX"
}

variable "domain_name" {
    type = string
    default = "rajeshirrinki.online"
}

variable instances {
    type = map 
    default = {
        mongodb = "t3.micro"
        user = "t3.micro"
        mysql = "t3.micro"
        frontend = "t3.micro"
    }
}