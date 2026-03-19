output "public-IP" {
  value = aws_instance.TF-Public-Server.public_ip
}

output "private-IP" {
  value = aws_instance.TF-Private-Server.private_ip
}