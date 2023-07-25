module "s3" {
  source = "../modules/s3"
  environment = "nonprod"
}

# TODO: Add nonprod branch in Github and setup branch protection 
# TODO: Make a pretty README file. 
# TODO: Actually deploy infrastructure for Cloud Resume Challenge.