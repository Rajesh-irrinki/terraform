resource "aws_instance" "roboshop" {
    instance_type = var.Environment == "prod" ? "t3.micro": "t2.small"
    ami = "ami_id"
    vpc_security_group_ids = [aws_security_group.allow-all-tf.id]

    tags = var.tags
}

resource "aws_security_group" "allow-all-tf" {
    name = "allow-all-tf"
    description = "This security group will allow all inbound and outbound traffic"

    ingress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      ipv6_cidr_blocks =["::/0"]
    }

    egress {
        from_port = 0
        to_port =0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = var.tags
}