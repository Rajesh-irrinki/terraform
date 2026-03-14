variable "Environment" {
  type = string
  default = "dev"
}

variable "ami_id" {
  type = string
  default = "ami-0220d79f3f480ecf5"
}
variable "tags" {
  type = map
  default = {
        Name = "roboshop-tf"
        Project = "roboshop"
        Terraform = "True"
  }
}