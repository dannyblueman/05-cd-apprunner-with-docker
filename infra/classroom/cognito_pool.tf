resource "aws_cognito_user_pool" "student_pool" {
  name              = var.classroom_name

  account_recovery_setting {
    recovery_mechanism {
      name     = "verified_email"
      priority = 1
    }
  }
}

resource "aws_cognito_user_pool_client" "webapp_client" {
  name = "webapp_client"
  user_pool_id = aws_cognito_user_pool.student_pool.id
  callback_urls = ["https://thecloudcollege.com/callback"]

}

