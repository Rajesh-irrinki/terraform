output "aws_instances" {
    value = aws_instance.roboshop
}

output "security_group" {
    value = aws_security_group.allow_all_tf
}