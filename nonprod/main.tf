module "s3" {
  source = "../modules/s3"
  environment = "nonprod"
}

#TODO: introduce best practice tf project structure
#TODO: add default tags