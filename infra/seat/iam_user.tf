resource "aws_iam_user" "student" {
  name  = var.student_id
}
resource "aws_iam_user_login_profile" "user_login" {
  user = aws_iam_user.student.name
  pgp_key = filebase64("classroom_key.pub")
  password_reset_required = false
  password_length = 8
}

resource "aws_iam_user_policy" "student_policy" {
  name = "test"
  user = aws_iam_user.student.name

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ecs:*",
        "cloud9:*",
        "ec2:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}