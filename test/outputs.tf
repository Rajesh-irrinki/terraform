output "private_ip" {
    value = aws_instance.roboshop.private_ip
}

output "instance_type" {
    value = aws_instance.roboshop.instance_type
}

output "tags" {
  value = aws_security_group.allow-all-sg-tf.tags
}