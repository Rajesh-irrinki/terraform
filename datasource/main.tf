resource "aws_instance" "roboshop" {
    ami = data.aws_ami.ami_id.id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.allow-all-sg-tf.id] 

    tags = merge( var.comman_tags , var.ec2_tags )
}

resource "aws_security_group" "allow-all-sg-tf" {
    name = "allow-all-sg-tf"
    description = "this security group will allow all the inbound and outbound traffic"

    ingress {
        from_port = "0"
        to_port = "0"
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = var.comman_tags
}

resource "aws_route53_record" "r53_records" {
    type = "A"
    ttl = 300
    zone_id = data.aws_route53_zone.zone_id.id
    name = "roboshop.rajeshirrinki.online"
    records = [aws_instance.roboshop.public_ip]
}