resource "aws_instance" "roboshop"{
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.allow_all_sg.id]
    tags = {
        Name = "roboshop-${var.Environment}"
        Environment = var.Environment
    }
}

resource "aws_security_group" "allow_all_sg" {
    name = var.sg_name
    description = "This security group will allow all inbound and outbound traffice"

    egress {
        protocol = var.protocol
        from_port = var.from_port
        to_port = var.to_port
        cidr_blocks = var.cidr_blocks
        ipv6_cidr_blocks = var.ipv6_cidr_blocks
    }

    ingress {
        from_port = var.from_port
        to_port = var.to_port
        protocol = var.protocol
        cidr_blocks = var.cidr_blocks
        ipv6_cidr_blocks = var.ipv6_cidr_blocks
    }

    tags = var.sg_tags

}
# CLI > tfvars > Environment > Variable default
# command line arugment variable
# variable in .tfvars file
# environmental variables
# variable block