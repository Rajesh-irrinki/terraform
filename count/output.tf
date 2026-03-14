output "roboshop_instances" {
  value       = aws_instance.roboshop
  description = "description"
}

output "roboshop_records" {
  value = aws_route53_record.www
  description = "Records creation output will be printed on console"
}

output "frontend_records" {
  value = aws_route53_record.frontend
  description = "Frontend record output will be printed on console"
}

output "list_instances" {
    value = var.instances
}

output "set_example" {
    value = var.set_example
}