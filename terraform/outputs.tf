output "PublicIP" {
  description = "Public IP of EC2 instance"
  value       = aws_instance.my-instance.public_ip
}

