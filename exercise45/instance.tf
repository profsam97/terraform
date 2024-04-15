resource "aws_key_pair" "hope-key" {
  key_name = "hopeKey"
  public_key = file("hopekey.pub")
}

resource "aws_instance" "hope_instance" {
    ami = var.AMIS[var.REGION]
    instance_type = "t2.micro"
    vpc_security_group_ids = [ "sg-041213ebdd97b5218" ]
    availability_zone = var.ZONE1
    key_name = aws_key_pair.hope-key.key_name
    tags = {
      name : "hope"
      project: "provisioning"
    }

    provisioner "file" {
      source = "web.sh"
      destination  = "/tmp/web.sh"
    }

 provisioner "remote-exec" {
        inline = [ 
            "chmod u+x /tmp/web.sh",
            "sudo /tmp/web.sh"
         ]
    }
    connection {
      host = self.public_ip
      user = var.USER
      private_key = file("hopekey")
    }

   
}

output "PublicIP" {
  value = aws_instance.hope_instance.public_ip
}

output "PrivateIP" {
  value = aws_instance.hope_instance.private_ip
}