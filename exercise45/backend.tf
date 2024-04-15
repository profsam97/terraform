terraform {
  backend "s3" {
    bucket = "terra-state-hope"
    key = "terraform/backend"
    region = "us-east-1"
  }
}