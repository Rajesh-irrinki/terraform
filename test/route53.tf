resource "aws_route53_record" "backend" {
    zone_id = var.zone_id
    type = "A"
    ttl = "300"
    name = "rajeshirrinki.online"
    records = [aws_instance.roboshop.private_ip]
}