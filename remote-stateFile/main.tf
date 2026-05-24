resource "aws_instance" "remote-statefile-demo" {
    ami = data.aws_ami.ami_id.id
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_all_sg_tf.id]
    tags = var.tags
}

resource "aws_security_group" "allow_all_sg_tf" {
    name = "allow-all-tf"
    description = "this security group will allow all ingress and egress traffic"

    ingress {
        from_port = 0
        to_port = 0
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

    tags = var.tags
}