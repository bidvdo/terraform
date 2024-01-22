output "iam_user_name" {
  description = "The user's name"
  value       = module.iam_user[*].iam_user_name
}


output "iam_user_login_profile_password" {
  description = "The user password"
  value       = module.iam_user[*].iam_user_login_profile_password
  sensitive   = true
}
