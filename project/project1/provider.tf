provider "aws" {
  region = var.region
}

terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "ebthal-tfstate-east1" # store state
    region         = "us-east-1"
    key            = "terraform.tfstate"
    dynamodb_table = "ebthal" #lock
    encrypt        = true
  }

}
