resource "aws_ecr_repository" "student_personal_repo" {
  name = var.student_id
}