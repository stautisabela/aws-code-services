output "ec2_public_ip" {
  value = module.ec2.public_ip
}

output "artifact_bucket" {
  value = module.s3.bucket_name
}

