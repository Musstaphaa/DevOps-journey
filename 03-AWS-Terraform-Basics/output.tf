output "server_public_ip" {
  description = "to print the public ip for the ec2 instance after build it "
  value       = aws_instance.my_pro_server.public_ip
}