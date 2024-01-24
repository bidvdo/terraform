module "iam_user" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "5.33.0"
  count   = 14

  name = "dobidv-user${count.index}"

  password_reset_required       = true
  create_iam_user_login_profile = true
  create_user                   = true
  create_iam_access_key         = false

  policy_arns = [
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
    "arn:aws:iam::aws:policy/AmazonEC2FullAccess",
    "arn:aws:iam::aws:policy/IAMFullAccess",
    "arn:aws:iam::aws:policy/AdministratorAccess",
  ]
}
