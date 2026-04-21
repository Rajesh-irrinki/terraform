# resource "aws_route53_record" "backend" {
#     count = length(var.instances)
#     zone_id = var.zone_id
#     type = "A"
#     ttl = "300"
#     name = "${var.instances[count.index]}.rajeshirrinki.online"
#     records = [aws_instance.roboshop[count.index].private_ip]
# }

# resource "aws_route53_record" "frontend" {
#     zone_id = var.zone_id
#     ttl = 300
#     name = "roboshop.rajeshirrinki.online"
#     records = [aws_instance.roboshop[index(var.instances,"frontend")].public_ip]
#     type = "A"
# }

resource "aws_route53_record" "r53_records" {
    for_each = aws_instance.roboshop

    zone_id = var.zone_id
    ttl = 300
    type = "A"
    name = "${each.key}.rajeshirrinki.online"
    records = [ each.key == "frontend" ? each.value.public_ip : each.value.private_ip]
}