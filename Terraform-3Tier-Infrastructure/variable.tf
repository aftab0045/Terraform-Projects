variable "vpc-cidr" {
  default = "10.0.0.0/16"
}

variable "private-cidr" {
  default = "10.0.0.0/20"
}

variable "public-cidr" {
  default = "10.0.16.0/20"
}

variable "az1" {
  default = "us-east-1a"
}
variable "az2" {
  default = "us-east-1b"
}

variable "public-RT-cidr" {
  default = "0.0.0.0/0"
}
variable "ami" {
  default = "ami-02dfbd4ff395f2a1b"
}

variable "instance-type" {
  default = "t2.micro"
}

variable "key-name" {
  default = "N Virginia Key"
}