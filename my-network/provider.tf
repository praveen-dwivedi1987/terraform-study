provider "aws" {
  
}

terraform {
  backend "s3" {
    bucket = "my-github-terraform-tfstate"
    key    = "my-network.tfstate"
    region = "us-east-1"
    dynamodb_table = "my-network-lock-table"
  }
}