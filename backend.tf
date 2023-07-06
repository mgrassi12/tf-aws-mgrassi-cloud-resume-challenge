provider "aws" {
    region = "ap-southeast-2"
    #TODO: add default tags here
}

terraform {
    required_version = ">= 1.0.0,< 2.0.0"
    
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 4.0"
      }
    }

    backend "s3" {
      bucket = "tf-aws-mgrassi-cloud-resume-challenge-state-bucket"
      key = "terraform.tfstate"
      region = "ap-southeast-2"
      encrypt = true
      #dynamodb_table = "terraform-locks"
    }
}
    
    