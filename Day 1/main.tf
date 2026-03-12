provider "aws" {
  region = "us-east-1"
}
# Day 1 -  Create an EC2 instance using Terraform
/*resource "aws_instance" "first_instance" {
    ami = "ami-02dfbd4ff395f2a1b"
    instance_type = "t3.micro"

    tags = {
      Name = "Terraform-Server"
    }
  
}
*/

# Day 2 - Practical 1 - Create an Security Group and Include it in the EC2 instance
/*resource "aws_security_group" "Test-SG" {
  name = "Terraform-SG"
  ingress  {
    description = "Allow SSH inbound traffic"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress  {
    description = "Allow HTTP inbound traffic"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress  {
    description = "Allow HTTPS inbound traffic"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress  {
    description = "Allow all outbound traffic"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }

}


resource "aws_instance" "second_instance" {
    ami = "ami-02dfbd4ff395f2a1b"
    instance_type = "t3.micro"
    key_name = "N Virginia Key"
    vpc_security_group_ids = [aws_security_group.Test-SG.id]
    tags = {
      Name = "Terraform-Server-2"
    }

}
*/

# Day 2 - Practical 2 - Count and For Each
/*resource "aws_instance" "count_instance" {
    count = 3
    ami = "ami-02dfbd4ff395f2a1b"
    instance_type = "t3.micro"
    key_name = "N Virginia Key"
    vpc_security_group_ids = ["sg-0398e23bfa06598ce"]
    tags = {
      Name = "Terraform-Count-Instance-${count.index + 1}"
    }

}*/

/*
resource "aws_instance" "Test" {
    for_each = tomap ({
      app = "t2.nano"
      db = "t2.micro"
      web = "t3.micro"
    })    
    ami = "ami-02dfbd4ff395f2a1b"
    instance_type = each.value
    key_name = "N Virginia Key"
    vpc_security_group_ids = ["sg-0398e23bfa06598ce"]
    tags = {
      Name = each.key
    }
  
}
*/

# Day 3 - Practical 1 - Default Variables
/*
resource "aws_instance" "variable_instance" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = "N Virginia Key"
  vpc_security_group_ids = [var.SG]

  tags = {
    Name = "Terraform-Variable-Instance"
  }

}

variable "ami" {
  default = "ami-02dfbd4ff395f2a1b"
}
variable "instance_type" {
  default = "t3.micro"
}
variable "SG" {
  default = "sg-0398e23bfa06598ce"
}*/

# Day 3 - Practical 2 - Variable Files (variable.tf)
resource "aws_instance" "variable_instance" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = "N Virginia Key"
  vpc_security_group_ids = [var.SG]

  tags = {
    Name = "Terraform-Variable-Instance"
  }

}