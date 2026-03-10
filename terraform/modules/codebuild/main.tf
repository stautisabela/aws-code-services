resource "aws_codebuild_project" "nginx_build" {
  name          = "Nginx-Build"
  service_role  = var.role_arn

  source {
    type            = "GITHUB"
    location        = var.github_repo_url
    buildspec       = "buildspec.yml"
  }

  artifacts {
    type = "S3"
    location = var.artifact_bucket
    packaging = "ZIP"
    name      = "demo-nginx"
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "aws/codebuild/standard:7.0"
    type         = "LINUX_CONTAINER"
  }
}