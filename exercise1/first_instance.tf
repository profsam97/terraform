provider "aws" {
   region = "us-east-1"
#    secret_key = "" we did not specify this as it is not safe to puch our cred to the repo we have awscli installed 
#    access_key = "" already on our terminal
}

resource "aws_instance" "my_first_instance" {
        ami = "ami-051f8a213df8bc089"
        availability_zone = "us-east-1a"
        instance_type = "t2.micro"
        key_name = "hope_tf"
        vpc_security_group_ids = ["sg-041213ebdd97b5218"]
        tags = {
          name = "my_first_instance"
        }
}