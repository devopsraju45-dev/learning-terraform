terraform {
  backend "s3" {
    bucket = "terraformstste"
    key    = "modules/sample1/terraform.tfstate"
    region = "us-east-1"
  }
}