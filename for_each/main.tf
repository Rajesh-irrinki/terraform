resource "aws_instance" "roboshop" {

  ami = var.ami_id
  vpc_security_group_ids = [aws_security_group.allow_all_tf.id]
  for_each = var.instances
  instance_type = each.value

  tags = {
    Name = "${each.key}-${var.Environment}"
    Environment = var.Environment
  }

}

resource "aws_security_group" "allow_all_tf" {

    name = "allow-all-sg-tf"

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

    tags = {
        Environment = var.Environment
        Name = "allow-all"
    }
}