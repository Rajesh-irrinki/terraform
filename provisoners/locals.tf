locals {
    instance_type = "t3.micro"
    ec2_tags = {
        Terraform = "true"
        Name = "provisioners-demo"
    }
    final_tags = merge (local.ec2_tags, var.project_tags)
}