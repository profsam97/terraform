variable "ZONE1" {
  default = "us-east-1a"
}
variable "ZONE2" {
  default = "us-east-1b"
}
variable "ZONE3" {
  default = "us-east-1c"
}

variable "PUB_KEY" {
  default = "hopeKey.pub"
}
variable "PRI_KEY" {
  default = "hopeKey"
}
variable "REGION" {
  default = "us-east-1"
}

variable "AMIS" {
  type = map
  default = {
    us-east-1 : "ami-051f8a213df8bc089"
    us-east-2 : "ami-051f8a213df8bc039"
  }
}

variable "USER" {
  default = "ec2-user"
}