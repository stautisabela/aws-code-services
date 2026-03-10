variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "eu-west-1"
}

variable "iam_instance_profile" {
  description = "IAM instance profile ARN or name for EC2 instances"
  type        = string
}

variable "project_name" {
  description = "Tag value to identify the project on resources"
  type        = string
}
