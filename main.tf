resource "aws_s3_bucket" "b" {
  bucket = "tf-aws-mgrassi-cloud-resume-challenge"
  acl    = "public"
}

#TODO: prevent billshock in AWS
#TODO: introduce tfsec
#TODO: introduce best practice tf project structure
#TODO: add state lock dynamodb
#TODO: add default tags