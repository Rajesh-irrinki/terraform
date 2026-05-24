resource "aws_instance" "provisioners_demo" {
    ami = data.aws_ami.ami_id.id
    instance_type = local.instance_type
    vpc_security_group_ids = [aws_security_group.allow_all_sg_tf.id]
    tags = local.final_tags

    provisioner "local-exec" {
      command = "echo ${self.public_ip} > inventory.ini"
    }

    provisioner "local-exec" {
      command = "exit 1"
      on_failure = continue
    }

    provisioner "local-exec" {
      command = "echo second_command"
    }

    provisioner "local-exec" {
      command = "echo resources are destroying"
      when = destroy
    }

    connection {
      type = "ssh"
      user = "ec2-user"
      password = "DevOps321"
      host = self.public_ip
    }

    provisioner "remote-exec" {
      inline = [ 
        "sudo dnf install nginx -y",
        "sudo systemctl start nginx"
       ]
    }

    provisioner "remote-exec" {
        inline = [ 
            "sudo systemctl stop nginx"
         ]
        when = destroy
    }
}

resource "aws_security_group" "allow_all_sg_tf" {
    name = "allow-all-tf"

    dynamic "ingress" {
        for_each = var.ingress_rules
        content {
          from_port = ingress.value.from_port
          to_port = ingress.value.to_port
          protocol = ingress.value.protocol
          cidr_blocks = ingress.value.cidr_blocks
        }
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}