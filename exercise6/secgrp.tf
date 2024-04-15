resource "aws_security_group" "hope-stack-sg" {
  name        = "hope stack sg"
  description = "Security group for hope ssh"
  vpc_id      = aws_vpc.hope_vpc

      egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress  {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [var.AMIS]
  }
  ingress {
        from_port = 80
        to_port = 80
        protocol = "tpc"
        cidr_blocks = [var.MYIP]
  }
  tags = {
    Name = "hope-stack-group"
  }
}
