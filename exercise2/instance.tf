resource "aws_instance" "rune" {
    ami = var.AMIS[var.REGION]
    availability_zone = var.ZONE1
    key_name = "hope_tf"
    vpc_security_group_ids = [ "sg-041213ebdd97b5218" ]
    instance_type = "t2.micro"
    tags = {
      name = "rune" 
    }
}