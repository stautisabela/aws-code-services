variable "service_role_arn" {
  description = "ARN of the IAM role that CodeDeploy will assume"
  type        = string
}

variable "ec2_tag_name" {
  description = "Value of the Name tag used to select EC2 instances"
  type        = string
}