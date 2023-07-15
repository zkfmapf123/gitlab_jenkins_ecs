module "jenkins-alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 8.0"

  name               = "jenkins-alb"
  load_balancer_type = "application"

  vpc_id = aws_vpc.vpc.id
  subnets = [
    for _, v in aws_subnet.publics :
    v.id
  ]
  security_groups = [aws_security_group.jenkins-sg.id]

  target_groups = [
    {
      name             = "jenkins-tg"
      backend_protocol = "HTTP"
      backend_port     = 8080
      target_type      = "instance"
      targets = {
        "jenkins" : {
          target_id = aws_instance.jenkin-ec2.id
          port      = 8080
        }
      }

      health_check = {
        enabled             = true
        interval            = 30
        path                = "/"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 15
        matcher             = "403"
      }
    }
  ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]
}