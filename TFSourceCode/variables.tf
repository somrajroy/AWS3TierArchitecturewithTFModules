# as best practise all variables should have default values, type and descrition.
# variable declarations are done in this file and defined in tfvars file.

# Generic variables
# east us has highest traffic and causes delay....selecting west...
variable "region" {
  description = "Region code"
  type        = string
  default     = "us-west-2"
}

# VPC variables
variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "three-tier-vpc"
}

# take a common VPC CIDR

variable "vpc_cidr" {
  description = "VPC CIDR range"
  type        = string
  default     = "10.0.0.0/16" # this is the module default. even not specified it will take this value. check module documentation
}

#select the AZ's for deloyment
variable "vpc_azs" {
  description = "List of AZs"
  type        = list(string)
  default     = ["us-west-2a", "us-west-2b"]
}

variable "vpc_public_subnets" {
  description = "public subnets"
  type        = list(string)
  default     = ["10.0.11.0/24", "10.0.12.0/24"]
}

variable "vpc_private_subnets" {
  description = "private subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "vpc_rdsdb_subnets" {
  description = "rds subnet CIDR ranges"
  type        = list(string)
  default     = ["10.0.21.0/24", "10.0.22.0/24"]
}

variable "vpc_tags" {
  description = "optional VPC tags"
  type        = map(string)
  default     = { "Name" = "TF3TierArchitecture", "created-by" = "TF" }
}

# ASG variables

variable "asg_sg_name" {
  description = "Name of the autoscaling group security group"
  type        = string
  default     = "3-tier-asg"
}

variable "asg_sg_description" {
  description = "Description of the autoscaling group security group"
  type        = string
  default     = "3-tier-asg-sg"
}

variable "asg_sg_tags" {
  description = "Tags for autoscaling group security group"
  type        = map(string)
  default     = { "Name" = "TF3TierArchitecture", "created-by" = "terraform" }
}

variable "asg_name" {
  description = "Name of the autoscaling group"
  type        = string
  default     = "3-tier-asg"
}

variable "asg_min_size" {
  description = "Auto scaling minimum size"
  type        = number
  default     = 0
}

variable "asg_max_size" {
  description = "Auto scaling maximum size"
  type        = number
  default     = 1
}

variable "asg_desired_capacity" {
  description = "Auto scaling desired capacity"
  type        = number
  default     = 1
}

variable "asg_wait_for_capacity_timeout" {
  description = "Auto scaling wait for capacity timeout"
  type        = number
  default     = 0
}

variable "asg_health_check_type" {
  description = "ASG health check type"
  type        = string
  default     = "EC2"
}

variable "asg_launch_template_name" {
  description = "Name of launch template"
  type        = string
  default     = "3-tier-LT"
}

variable "asg_launch_template_description" {
  description = "autoscaling group security group"
  type        = string
  default     = "3-tier-LT"
}

variable "asg_update_default_version" {
  description = "ASG update default version"
  type        = bool
  default     = true
}

#select the ami id from console. This can also be done by data but here it is taken from console for convinience

variable "asg_image_id" {
  description = "ASG image id"
  type        = string
  default     = "ami-08541bb85074a743a"
}

variable "asg_instance_type" {
  description = "Auto scaling group instance type"
  type        = string
  default     = "t3.micro"
}

variable "asg_ebs_optimized" {
  description = "ASG ebs optimized"
  type        = bool
  default     = true
}

#dsiable monitoring if not needed

variable "asg_enable_monitoring" {
  description = "ASG enable monitoring"
  type        = bool
  default     = false
}

variable "asg_create_iam_instance_profile" {
  description = "ASG create iam instance profile"
  type        = bool
  default     = true
}

variable "asg_iam_role_name" {
  description = "ASG iam role name"
  type        = string
  default     = "3tier-asg-iam-role"
}

variable "asg_iam_role_path" {
  description = "ASG iam role path"
  type        = string
  default     = "/ec2/"
}

variable "asg_iam_role_description" {
  description = "ASG iam role description"
  type        = string
  default     = "3tier-asg-iam-role"
}

variable "asg_iam_role_tags" {
  description = "ASG iam role tags"
  type        = map(string)
  default     = { "created-by" = "terraform" }
}

variable "asg_block_device_mappings_volume_size_0" {
  description = "ASG block device mapping volume size 0"
  type        = number
  default     = 20
}

variable "asg_block_device_mappings_volume_size_1" {
  description = "ASG block device mapping volume size 1"
  type        = number
  default     = 30
}

variable "asg_instance_tags" {
  description = "ASG instance tags"
  type        = map(string)
  default     = { "Name" = "3-Tier-Arch", "created-by" = "terraform" }
}

variable "asg_volume_tags" {
  description = "Auto scaling group volume tags"
  type        = map(string)
  default     = { "created-by" = "terraform" }
}

variable "asg_tags" {
  description = "Auto scaling group tags"
  type        = map(string)
  default     = { "created-by" = "terraform" }
}

# ALB variables
variable "alb_sg_name" {
  description = "ALB security group name"
  type        = string
  default     = "3Tier-alb-sg"
}

variable "alb_sg_ingress_cidr_blocks" {
  description = "ALB cidr blocks"
  type        = list(any)
  default     = ["0.0.0.0/0"]
}

variable "alb_sg_description" {
  description = "ALB security group description"
  type        = string
  default     = "3Tier-alb-sg"
}

variable "alb_sg_tags" {
  description = "Application load balancer security group tags"
  type        = map(string)
  default     = { "created-by" = "terraform" }
}

variable "alb_description" {
  description = "Application load balancer description"
  type        = string
  default     = "3Tier-alb"
}

variable "alb_name" {
  description = "Application load balancer name"
  type        = string
  default     = "3Tier-alb"
}

variable "alb_http_tcp_listeners_port" {
  description = "ALB http listeners port"
  type        = number
  default     = 80
}

variable "alb_target_group_name" {
  description = "ALB target group name"
  type        = string
  default     = "3Tier-alb-tg"
}

variable "alb_target_groups_backend_port" {
  description = "alb http listeners port"
  type        = number
  default     = 80
}

variable "alb_tags" {
  description = "alb tags"
  type        = map(string)
  default     = { "created-by" = "terraform" }
}

# RDS variables
variable "rds_sg_name" {
  description = "RDS security group name"
  type        = string
  default     = "ThreeTier-rds-sg"
}

variable "rds_sg_description" {
  description = "RDS security group description"
  type        = string
  default     = "ThreeTier-rds-sg"
}

variable "rds_sg_tags" {
  description = "RDS security group tags"
  type        = map(string)
  default     = { "created-by" = "terraform" }
}

variable "option_group_name_rds" {
  description = "Name of the option group"
  type        = string
  default     = "threetier-demo"
}

variable "option_group_description_rds" {
  description = "The description of the option group"
  type        = string
  default     = "3 tier example description"
}

variable "rds_identifier" {
  description = "RDS identifier"
  type        = string
  default     = "threetier-rds"
}

variable "rds_mysql_engine" {
  description = "RDS mysql engine"
  type        = string
  default     = "mysql"
}

variable "rds_engine_version" {
  description = "RDS mysql engine version"
  type        = string
  default     = "8.0.33"
}

variable "rds_family" {
  description = "RDS family"
  type        = string
  default     = "mysql8.0"
}

variable "rds_major_engine_version" {
  description = "RDS major engine version"
  type        = string
  default     = "8.0"
}

variable "rds_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t2.small"
}

variable "rds_allocated_storage" {
  description = "RDS allocated storage"
  type        = number
  default     = 20
}

variable "rds_max_allocated_storage" {
  description = "RDS max allocated storage"
  type        = number
  default     = 100
}

variable "rds_db_name" {
  description = "RDS db name"
  type        = string
  default     = "ThreeTier_mysql"
}

variable "rds_username" {
  description = "RDS username"
  type        = string
  default     = "ThreeTier_user"
}

variable "rds_port" {
  description = "RDS port"
  type        = number
  default     = 3306
}

variable "rds_multi_az" {
  description = "RDS multi az"
  type        = bool
  default     = false
}

variable "rds_maintenance_window" {
  description = "RDS window"
  type        = string
  default     = "Mon:00:00-Mon:03:00"
}

variable "rds_backup_window" {
  description = "RDS backup window"
  type        = string
  default     = "03:00-06:00"
}

variable "rds_enabled_cloudwatch_logs_exports" {
  description = "RDS enabled cloudwatch log exports"
  type        = list(any)
  default     = ["general"]
}

variable "rds_create_cloudwatch_log_group" {
  description = "RDS create cloudwatch log group"
  type        = bool
  default     = true
}

variable "rds_backup_retention_period" {
  description = "RDS backup retention period"
  type        = number
  default     = 0
}

variable "rds_skip_final_snapshot" {
  description = "RDS skip final snapshot"
  type        = bool
  default     = true
}

variable "rds_deletion_protection" {
  description = "RDS deletion protection"
  type        = bool
  default     = false
}

variable "rds_performance_insights_enabled" {
  description = "RDS insights enabled"
  type        = bool
  default     = false
}

variable "rds_performance_insights_retention_period" {
  description = "RDS retention period"
  type        = number
  default     = 7
}

variable "rds_create_monitoring_role" {
  description = "RDS create monitoring role"
  type        = bool
  default     = true
}

variable "rds_monitoring_interval" {
  description = "RDS monitoring interval"
  type        = number
  default     = 60
}

variable "rds_tags" {
  description = "RDS tags"
  type        = map(string)
  default     = { "created-by" = "terraform" }
}

variable "rds_db_instance_tags" {
  description = "RDS db instance tags"
  type        = map(string)
  default     = { "created-by" = "terraform" }
}

variable "rds_db_option_group_tags" {
  description = "RDS db option group tags"
  type        = map(string)
  default     = { "created-by" = "terraform" }
}

variable "rds_db_parameter_group_tags" {
  description = "RDS db parameter group tags"
  type        = map(string)
  default     = { "created-by" = "terraform" }
}

variable "rds_db_subnet_group_tags" {
  description = "RDS db subnet group tags"
  type        = map(string)
  default     = { "created-by" = "terraform" }
}