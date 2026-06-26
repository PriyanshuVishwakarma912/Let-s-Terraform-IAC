terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "6.38.0"
    }
  }

  backend "s3" {
    bucket = ""
    dynamodb_table = ""
    key ="terraform.tfstate"
    region = "ap-south-1"

  }
}
