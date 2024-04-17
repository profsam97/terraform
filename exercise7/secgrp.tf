resource "aws_security_group" "hope-elb-sg" {
  name        = "hope elb sg"
  description = "Security group for elb"
  vpc_id      = aws_vpc.hope_vpc.id

      egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" # semantically equivalent to all ports
    cidr_blocks      = ["0.0.0.0/0"]
  
  }

  ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"] //provide inbound traffic for our load balancer on port 80
  }
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"] //provide inbound traffic for our load balancer on port 443
  }
  tags = {
    Name = "hope-elb-group"
  }
}

resource "aws_security_group" "hope-stack-sg" {
  name        = "hope stack sg"
  description = "Security group for hope-stack"
  vpc_id      = aws_vpc.hope_vpc.id

  
  tags = {
    Name = "hope-stack-group"
  }
}


resource "aws_vpc_security_group_ingress_rule" "allow_all_traffic_from_any_instance_in_our_vpc" {
  security_group_id = aws_security_group.hope-stack-sg.id
  from_port = 80
  to_port = 80
  ip_protocol = "tcp"
  cidr_ipv4 = aws_vpc.hope_vpc.cidr_block //any instance in hope_vpc will be allowed access here 

}



resource "aws_vpc_security_group_ingress_rule" "allow_all_traffic_for_ipv4_on_ssh" {
  security_group_id = aws_security_group.hope-stack-sg.id
  from_port = 22
  to_port = 22
  ip_protocol = "tcp"
  cidr_ipv4 = "0.0.0.0/0" //allows traffic for ssh 

}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.hope-stack-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

