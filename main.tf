resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket"
  acl    = "private"
}

#TODO: prevent billshock in AWS
#TODO: introduce tfsec
#TODO: introduce best practice tf project structure
#TODO: add state lock dynamodb
#TODO: add default tags