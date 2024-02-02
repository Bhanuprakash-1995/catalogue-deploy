# terraform {
#   backend "s3" {
#     bucket         = "dev-backend-roboshopapp"
#     key            = "catalogue-dev"
#     region         = "us-east-1"
#     dynamodb_table = "dev-lock"
#   }
# }
# provider "aws" {
#   region = "us-east-1"
# }
terraform {
  backend "s3" {
    bucket         = "dev-backend-roboshopapp"
    key            = "shipping"
    region         = "us-east-1"
    dynamodb_table = "dev-lock"
  }
}

provider "aws" {
  region = "us-east-1"
}
