# locals {
#   instance_type = "t3.medium"
# }

resource "aws_instance" "roboshop" {
    # count = length(var.instances)
    for_each = toset(var.instances)
    ami = var.ami_id
    instance_type = var.instance_type
    # instance_type = local.instance_type
    vpc_security_group_ids = [aws_security_group.allow-all-sg-tf.id]

    tags = {
        Name = each.key
        Project = "Roboshop"
        Environment = "dev"
    }
    # tags = var.tags
}

resource "aws_security_group" "allow-all-sg-tf" {
    name = "allow-all-sg-tf"
    description = "allow all traffic"
    
    dynamic "ingress" {
      for_each = var.port

      content {

        from_port = ingress.value
        to_port = ingress.value
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        
      }
    }

    dynamic "egress" {
      for_each = var.port

      content {

        from_port = egress.value
        to_port = egress.value
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        
      }
    }

    # ingress {
    #     from_port = var.port_number
    #     to_port = var.port_number
    #     protocol = "-1"
    #     cidr_blocks = ["0.0.0.0/0"]
    #     ipv6_cidr_blocks = ["::/0"]
    # }

    # egress {
    #     from_port = 0
    #     to_port = 0
    #     protocol = "-1"
    #     cidr_blocks = var.cidr_blocks
    #     ipv6_cidr_blocks = ["::/0"]
    # }

    tags = {
        Name = "allow-all-sg-tf"
        Environment = "dev"
        terraform = var.terraform
    }
}

# precedence of variable values :
# 1. Value will be assigned from CLI
# 2. Value from .tfvars file
# 3. Value from the environmental variables
# 4. default value