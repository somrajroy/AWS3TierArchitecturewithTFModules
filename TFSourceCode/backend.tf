terraform {
  backend "s3" {
    bucket         = "tf-3-tier-architecture"
    encrypt        = true
    key            = "terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "TF3TierArchitecture"
  }
}