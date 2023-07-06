provider "aws" {
    region = "ap-southeast-2"

    assume_role {
        role_arn = "arn:aws:iam::901279261574:role/GitHubAction-AssumeRoleWithAction"
        session_name = "tf-aws-mgrassi-cloud-resume-challenge"
        external_id = "mgrassi12@github"
    }

    #default_tags{
    #    tags = <add here>
    #}
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
      #role_arn = "arn:aws:iam::901279261574:role/GitHubAction-AssumeRoleWithAction"
    }
}
    
    