resource "aws_route53_record" "backend" {
    for_each = aws_instance.roboshop
    zone_id = var.zone_id
    ttl = 300
    type = "A"
    name = "${each.key}.${var.domain_name}"
    records = [each.value.private_ip]
}

resource "aws_route53_record" "frontend" {
    ttl = 300
    zone_id = var.zone_id
    records = [lookup(aws_instance.roboshop, "frontend").public_ip]
    name = "roboshop.${var.domain_name}"
    type = "A"

}