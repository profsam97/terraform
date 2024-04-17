terraform {
  backend "s3" {
    bucket = "terra-state-hope"
    key = "terraform/backend-exercise6"
    region = "us-east-1"
  }
}