output "PublicIP" {
  description = "Public IP of EC2 instance"
  value       = aws_instance.my-instance.public_ip
}

output "SSH_SG_ID" {
  description = "SSH Security Group ID"
  value       = aws_security_group.allow_ssh.id
}

output "HTTP_SG_ID" {
  description = "HTTP Security Group ID"
  value       = aws_security_group.allow_http.id
}