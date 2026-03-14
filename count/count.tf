resource "aws_instance" "roboshop" {
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.allow_all_tf.id]
    count = length(var.instances)

    tags = {
        Name = "roboshop-${var.instances[count.index]}"
    }

}

resource "aws_security_group" "allow_all_tf" {
    name = "allow_all_tf"

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

    tags = var.sg_tags  
}