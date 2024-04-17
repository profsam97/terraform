resource "aws_s3_bucket" "hope_access_logs" {
  bucket = "hope-elb-access-logs"
  tags = {
    Name        = "ELB Logs Bucket"
    Environment = "Production"
  }
}

resource "aws_lb" "hope-lb" {
  name               = "hope-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.hope-elb-sg.id]
  subnets            = local.public_subnets

  enable_deletion_protection = true

  access_logs {
    bucket =  aws_s3_bucket.hope_access_logs.id
    prefix  = "hope-lb"
    enabled = true
  }

  tags = {
    Environment = "production"
  }
}

resource "aws_lb_target_group" "hope-tg" {
  name     = "hope-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.hope_vpc.id
}

resource "aws_lb_target_group_attachment" "hope-tg-attachment" {
  target_group_arn = aws_lb_target_group.hope-tg.arn
  target_id        = aws_instance.hope_instance.id
  port             = 80
}

resource "aws_lb_listener" "hope-front_end" {
  load_balancer_arn = aws_lb.hope-lb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.hope-tg.arn
  }
}