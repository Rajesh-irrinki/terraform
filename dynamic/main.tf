resource "aws_instance" "roboshop" {
    instance_type = "t3.micro"
    ami = "ami-0220d79f3f480ecf5"
    vpc_security_group_ids = [aws_security_group.sg-tf.id]

    tags = {
        Name = "sg-tf"
        Environment = "dev"
        Project = "roboshop"
    }
}

resource "aws_security_group" "sg-tf" {

    name = "allow-all_sg-tf"

    dynamic "ingress" {
        for_each = var.ingress_rules
        content {
            from_port = ingress.value.port
            to_port = ingress.value.port
            protocol = ingress.value.protocol
            cidr_blocks = ingress.value.cidr_blocks
            description = ingress.value.description
        }
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
        Name = "sg-tf"
        Environment = "dev"
        Project = "roboshop"
    }
}