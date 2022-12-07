terraform {
  required_providers {
    sheeruaws = {
      source  = "hashicorp/aws"
      version = "~> 4.40.0"
    }
  }
}

module "iam_account" {
  source = "terraform-aws-modules/iam/aws//modules/iam-account"

  account_alias = "awesome-company"

  minimum_password_length = 37
  require_numbers         = false
}
