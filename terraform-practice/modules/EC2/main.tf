resource "aws_instance" "module_instance" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = [var.security_group_id]

  # Defining local provisioner block
    /*provisioner "local-exec" {
        command = "echo ${aws_instance.module_instance.public_ip} > public_ip.txt"
    }*/

  # Defining remote provisioner block
    provisioner "remote-exec" {
        inline = [
            "sudo yum update -y",
            "sudo yum install nginx -y",
            "sudo systemctl start nginx",
            "sudo systemctl enable nginx",
        ]

        connection {
            type = "ssh"
            user = "ec2-user"
            private_key = file("C:/Downloads/N Virginia Key.pem")
            host = self.public_ip
        }
    }

  tags = {
    Name = "Terraform-Module-Instance"
  }
}