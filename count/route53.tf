resource "aws_route53_record" "www" {
    count = length(var.instances)
    zone_id = var.zone_id
    name = "${var.instances[count.index]}.${var.domain}"
    type = "A"
    ttl = 300
    records = [aws_instances.roboshop[count.index].private_ip]
}

resource "aws_route53_record" "frontend" {
    zone_id = var.zone_id
    name = "roboshop.${var.domain}"
    ttl = 300
    type = "A"
    records = [aws_instances.roboshop[index(var.instances, "frontend")].public_ip]
}