module "s3" {
  source = "./modules/s3"

  project_name = var.project_name
}

module "iam" {
  source = "./modules/iam"
}

module "ec2" {
  source = "./modules/ec2"

  aws_region           = var.aws_region
  iam_instance_profile = module.iam.ec2_instance_profile
  project_name         = var.project_name
}

module "codebuild" {
  source = "./modules/codebuild"

  artifact_bucket = module.s3.bucket_name
  github_repo_url = var.github_repo_url
  role_arn        = module.iam.codebuild_role_arn
}

module "codedeploy" {
  source = "./modules/codedeploy"

  service_role_arn = module.iam.codedeploy_role_arn
  ec2_tag_name     = var.project_name
}