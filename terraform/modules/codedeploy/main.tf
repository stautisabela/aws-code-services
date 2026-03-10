resource "aws_codedeploy_app" "nginx_app" {
  name = "Nginx-app"
  compute_platform = "Server"
}

resource "aws_codedeploy_deployment_group" "nginx_deploy" {
  app_name              = aws_codedeploy_app.nginx_app.name
  deployment_group_name = "nginx-deploy-group"
  service_role_arn      = var.service_role_arn
  deployment_config_name = "CodeDeployDefault.AllAtOnce"

  ec2_tag_set {
    ec2_tag_filter {
      key   = "Name"
      type  = "KEY_AND_VALUE"
      value = var.ec2_tag_name
    }
  }
}