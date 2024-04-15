resource "aws_security_group" "hope-stack-sg" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.hope_vpc

  tags = {
    Name = "allow_tls"
  }
}
