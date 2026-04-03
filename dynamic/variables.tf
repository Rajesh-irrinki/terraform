variable "ingress_rules" {
    default = [
        {
            port = "22"
            protocol = "tcp"
            description = "port 22 will be open for ingress"
            cidr_blocks = ["0.0.0.0/0"]
        },
        {
            port = "443"
            protocol = "tcp"
            description = "port 443 will be open for tcp ingress communication"
            cidr_blocks = ["0.0.0.0/0"]
        },
        {
            port = "3036"
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
            description = "port 3036 will be open for tcp ingress communication"
        }
    ]
}