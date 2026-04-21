variable "ami_id" {
    type = string
    default = "ami-0220d79f3f480ecf5"
}

variable "instance_type" {
    type = string

    validation {
        condition = contains (["t3.micro"],var.instance_type)
        error_message = "Instance type must be t3.micro"
    }
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

variable "port" {
    type = list(number)
    description = "List of port numbers for creating security group rules"
}

variable "cidr_blocks" {
    type = list
    default = ["0.0.0.0/0"]
}
variable "terraform" {
    type = bool
    default = true
}

variable "instances" {
    type = list 
    description = "List of Instances"
}