data "aws_ami" "ami_id" {

    owners = ["973714476881"]

    filter {
      name = "name"
      values = ["Redhat-9-DevOps-Practice"]
    }

    filter {
      name = "virtualization-type"
      values = ["hvm"]
    }
}

data "aws_route53_zone" "zone_id" {
    name = "rajeshirrinki.online"
    private_zone = false
}