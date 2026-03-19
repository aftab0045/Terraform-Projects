# Define the Terraform backend to store state in an S3 bucket
terraform {
  backend "s3" {
    bucket = "terraform-3tier-infrastructure"
    key = "terraform.tfstate"
    region = "us-east-1"
  }
}

# Define the AWS provider and region
provider "aws" {
  region = "us-east-1"
}

# Define the VPC
resource "aws_vpc" "tf-vpc" {
  cidr_block = var.vpc-cidr
    tags = {
        Name = "TF-VPC"
    }
  
}

# Define the private subnet
resource "aws_subnet" "tf-private-subnet" {
  vpc_id = aws_vpc.tf-vpc.id
  cidr_block = var.private-cidr
  availability_zone = var.az1
    tags = {
        Name = "TF-Private-Subnet"
    }
}

# Define the public Subnet
resource "aws_subnet" "tf-public-subnet" {
  vpc_id = aws_vpc.tf-vpc.id
  cidr_block = var.public-cidr
  availability_zone = var.az2
  map_public_ip_on_launch = true 
    tags = {
        Name = "TF-Public-Subnet"
    }
}

# Define the Internet Gateway and attach it to the VPC
resource "aws_internet_gateway" "tf-internet-gateway" {
  vpc_id = aws_vpc.tf-vpc.id
    tags = {
        Name = "TF-Internet-Gateway"
    }
}

# Define the default route table and associate it with the public subnet
resource "aws_default_route_table" "main-RT" {
  default_route_table_id = aws_vpc.tf-vpc.default_route_table_id
  tags = {
    Name = "TF-Main-Route-Table"
  }
}

# Define the route to the Internet Gateway for the public subnet
resource "aws_route" "public-RT" {
  route_table_id = aws_default_route_table.main-RT.id
  destination_cidr_block = var.public-RT-cidr
  gateway_id = aws_internet_gateway.tf-internet-gateway.id
}

# Define Security Group to allow SSH, MySQL, HTTP, and Tomcat traffic
resource "aws_security_group" "TF-SG" {
  name = "TF-SG"
    description = "Allow SSH, mysql, HTTP traffic, tomcat"
    vpc_id = aws_vpc.tf-vpc.id
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    depends_on = [ aws_vpc.tf-vpc ]
}

# Define the Public EC2 instance in the public subnet
resource "aws_instance" "TF-Public-Server" {
    subnet_id = aws_subnet.tf-public-subnet.id
    ami = var.ami
    key_name = var.key-name
    instance_type = var.instance-type
    vpc_security_group_ids = [aws_security_group.TF-SG.id]

    tags = {
      Name = "Proxy-Server"
    }

    depends_on = [ aws_security_group.TF-SG ]   
}

# Define the Private EC2 instance in the private subnet
resource "aws_instance" "TF-Private-Server" {
    subnet_id = aws_subnet.tf-private-subnet.id
    ami = var.ami
    key_name = var.key-name
    instance_type = var.instance-type
    vpc_security_group_ids = [aws_security_group.TF-SG.id]

    tags = {
      Name = "App-Server"
    }

    depends_on = [ aws_security_group.TF-SG ]   
}