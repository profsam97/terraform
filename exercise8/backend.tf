terraform {
  backend "s3" {
    bucket = "terra-state-hope"
    key = "terraform/backend-exercise8"
    region = "us-east-1"
  }
}