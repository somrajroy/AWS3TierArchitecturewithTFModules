# SG configuration. The documentation has all details including example usage and we need to copy/paste.
# official documentation link : https://registry.terraform.io/modules/terraform-aws-modules/security-group/aws/latest

module "alb_http_sg" {
  source  = "terraform-aws-modules/security-group/aws//modules/http-80"
  version = "5.1.0"

  name        = var.alb_sg_name
  vpc_id      = module.vpc.vpc_id
  description = var.alb_sg_description

  ingress_cidr_blocks = var.alb_sg_ingress_cidr_blocks
  tags                = var.alb_sg_tags
}


# ALB configuration of module. The documentation has all details including example usage and we need to copy/paste.
# official link is https://registry.terraform.io/modules/terraform-aws-modules/alb/aws/latest


module "alb" {
  source          = "terraform-aws-modules/alb/aws"
  version         = "8.7.0"
  name            = var.alb_name
  vpc_id          = module.vpc.vpc_id
  subnets         = module.vpc.public_subnets
  security_groups = [module.alb_http_sg.security_group_id]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  target_groups = [
    {
      name             = var.alb_target_group_name
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      stickiness       = { "enabled" = true, "type" = "lb_cookie" }
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/phpinfo.php"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }
    },
  ]

  tags = var.alb_tags
}