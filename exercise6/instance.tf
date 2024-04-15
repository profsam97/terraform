resource "aws_key_pair" "hope-key" {
  key_name = "hopeKey"
  public_key = file(var.PUB_KEY)
}

resource "aws_instance" "hope_instance" {
    ami = var.AMIS[var.REGION]
    instance_type = "t2.micro"
    subnet_id = aws_subnet.hope-pub-1.id
    vpc_security_group_ids = [ aws_security_group.hope-stack-sg.id]
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
            "sudo /tmp/web.sh"  // make sure you edit the sg to allow access on port 80 from your ip
         ]
    }
    connection {
      host = self.public_ip
      user = var.USER
      private_key = file(var.PRI_KEY)
    }

   
}

resource "aws_ebs_volume" "vol_4_hope" {
  availability_zone = var.ZONE1
  size = 3
  tags = {
    Name = "vol_4_hope" 
  }
}

resource "aws_volume_attachment" "atta_vol_hope" {
   device_name = "/dev/sdh"
   volume_id = aws_ebs_volume.vol_4_hope.id
   instance_id = aws_instance.hope_instance.id
}

output "PublicIP" {
  value = aws_instance.hope_instance.public_ip
}

output "PrivateIP" {
  value = aws_instance.hope_instance.private_ip
}