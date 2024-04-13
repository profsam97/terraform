provider "aws" {
   region = "us-east-1"
#    secret_key = "" we did not specify this as it is not safe to puch our cred to the repo we have awscli installed 
#    access_key = "" already on our terminal
}

resource "aws_instance" "my_first_instance" {
        ami = ""
        availability_zone = "us-east-1a"
        instance_type = "t2.micro"
        key_name = ""
        security_groups = [ "" ]
        tags = {
          name = "hope_tf"
        }
}