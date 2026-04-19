# locals {
#   instance_type = "t3.medium"
# }

resource "aws_instance" "roboshop" {
    ami = var.ami_id
    instance_type = var.instance_type
    # instance_type = local.instance_type
    vpc_security_group_ids = [aws_security_group.allow-all-sg-tf.id]

    tags = {
        Name = "roboshop-ec2"
        Project = "Roboshop"
        Environment = "dev"
    }
}

resource "aws_security_group" "allow-all-sg-tf" {
    name = "allow-all-sg-tf"
    description = "allow all traffic"

    ingress {
        from_port = 0
        to_port =0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
        Name = "allow-all-sg-tf"
        Environment = "dev"
    }
}