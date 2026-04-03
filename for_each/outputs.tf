output "aws_instances" {
    value = aws_instance.roboshop
}

output "security_group" {
    value = aws_security_group.allow_all_tf
}

output "route53_backendRecords"{
    value = aws_route53_record.backend
}

output "route53_frontendRecords" {
    value = aws_route53_record.frontend
}