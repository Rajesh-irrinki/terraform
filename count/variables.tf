variable "instance_type" {
  type = string
  default = "t3.micro"
}

variable "ami_id" {
  type = string
  default = "ami-0220d79f3f480ecf5"
}

variable "sg_tags" {
    type = map 
    default = {
        Name = "allow_all_sg_tf"
        Project = "Roboshop-tf"
        Environment = "dev"
    }
}

variable "instances" {
  type = list(string) 
  default = ["catalogue","user","cart","frontend"]
}

variable "zone_id" {
  type = string
  default = "Z04304691CJEXLOI5ZISX"
}

variable "domain" {
  type = string
  default = "rajeshirrinki.online"
}