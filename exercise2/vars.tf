variable "REGION" {
    default = "us-east-1"
}

variable "ZONE1" {
    default = "us-east-1a"
}

variable "AMIS" {
    type = map()
    default = {
        us-east-1 : "ami-051f8a213df8bc089"
        us-east-2 : "ami-051f8a213df8bc023"
    }
}