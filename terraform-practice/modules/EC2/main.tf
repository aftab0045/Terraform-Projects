resource "aws_instance" "module_instance" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name = "Terraform-Module-Instance"
  }
}