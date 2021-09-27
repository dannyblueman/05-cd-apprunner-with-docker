output "cloud9_url" {
  value = "https://${var.region}.console.aws.amazon.com/cloud9/ide/${aws_cloud9_environment_ec2.cloud_9_env.id}"
}

output "password" {
  value = aws_iam_user_login_profile.user_login.encrypted_password
}

output "access_key_id" {
  value = aws_iam_access_key.student.id
}

output "secret_access_key" {
  value = aws_iam_access_key.student.encrypted_secret
}