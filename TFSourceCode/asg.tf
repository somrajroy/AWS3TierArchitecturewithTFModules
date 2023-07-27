### call the user data to bootstrap the servers.

locals {
  # user_data = file("awsuserdata.sh")
  user_data = file("awsuserdata2023linux.sh")
}

# asg configuration files
# module documentation : https://registry.terraform.io/modules/terraform-aws-modules/security-group/aws/latest

module "asg_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

  name        = var.asg_sg_name
  description = var.asg_sg_description
  vpc_id      = module.vpc.vpc_id

  # alb SG as source for port 80. It is not CIDR range

  computed_ingress_with_source_security_group_id = [
    {
      rule                     = "http-80-tcp"
      source_security_group_id = module.alb_http_sg.security_group_id
    }
  ]
  number_of_computed_ingress_with_source_security_group_id = 1

  egress_rules = ["all-all"]

  tags = var.asg_sg_tags
}


# asg module documentation is https://registry.terraform.io/modules/terraform-aws-modules/autoscaling/aws/latest


module "asg" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "6.10.0"

  # Autoscaling group
  name = var.asg_name

  min_size                  = var.asg_min_size
  max_size                  = var.asg_max_size
  desired_capacity          = var.asg_desired_capacity
  wait_for_capacity_timeout = var.asg_wait_for_capacity_timeout
  health_check_type         = var.asg_health_check_type
  vpc_zone_identifier       = module.vpc.private_subnets
  target_group_arns         = module.alb.target_group_arns
  user_data                 = base64encode(local.user_data)

  # Launch template
  launch_template_name        = var.asg_launch_template_name
  launch_template_description = var.asg_launch_template_description
  update_default_version      = var.asg_update_default_version

  image_id          = var.asg_image_id
  instance_type     = var.asg_instance_type
  ebs_optimized     = var.asg_ebs_optimized
  enable_monitoring = var.asg_enable_monitoring

  # IAM role & instance profile
  create_iam_instance_profile = var.asg_create_iam_instance_profile
  iam_role_name               = var.asg_iam_role_name
  iam_role_path               = var.asg_iam_role_path
  iam_role_description        = var.asg_iam_role_description
  iam_role_tags               = var.asg_iam_role_tags
  iam_role_policies = {
    AmazonSSMManagedInstanceCore = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  }

  block_device_mappings = [
    {
      # Root volume
      device_name = "/dev/xvda"
      no_device   = 0
      ebs = {
        delete_on_termination = true
        encrypted             = true
        volume_size           = var.asg_block_device_mappings_volume_size_0
        volume_type           = "gp2"
      }
      }, {
      device_name = "/dev/sda1"
      no_device   = 1
      ebs = {
        delete_on_termination = true
        encrypted             = true
        volume_size           = var.asg_block_device_mappings_volume_size_1
        volume_type           = "gp2"
      }
    }
  ]

  network_interfaces = [
    {
      delete_on_termination = true
      description           = "eth0"
      device_index          = 0
      security_groups       = [module.asg_sg.security_group_id]
    },
    {
      delete_on_termination = true
      description           = "eth1"
      device_index          = 1
      security_groups       = [module.asg_sg.security_group_id]
    }
  ]

  tag_specifications = [
    {
      resource_type = "instance"
      tags          = var.asg_instance_tags
    },
    {
      resource_type = "volume"
      tags          = var.asg_volume_tags
    }
  ]

  tags = var.asg_tags
}