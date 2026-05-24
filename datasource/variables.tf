variable "instance_type" {
  type = string
  description = "Instance type variable"
}

variable "comman_tags" {
  default = {
    Project = "roboshop"
    Environment = "dev"
    Terraform = "true"
  }
}

variable "ec2_tags" {
  default = {
    Name = "frontend"
    Project = "roboshop"
    Environment = "dev"
  }
}