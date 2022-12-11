module "nlb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 6.0"

  name = "nbl-2"

  load_balancer_type = "network"

  vpc_id  = "vpc-0d82b899b0d29f493"
  subnets = ["subnet-0ba522cb6aad1187b", "subnet-0579b73f2a4cf842e"]

  access_logs = {
    bucket = "my-nlb-logs"
  }

  target_groups = [
    {
      name_prefix      = "TG"
      backend_protocol = "TCP"
      backend_port     = 80
      target_type      = "instances"
    }
  ]

  https_listeners = [
    {
      port               = 443
      protocol           = "TLS"
      certificate_arn    = "arn:aws:elasticloadbalancing:us-east-1:635809853153:listener/net/nbl-2/a2647e462f65302c/6b3fa5f96057078d"
      target_group_index = 0
    }
  ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "TCP"
      target_group_index = 0
    }
  ]

  tags = {
    Name = "TG"
  }
}