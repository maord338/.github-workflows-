output "bastion_public_ip" {
  description = "Public IP of the Bastion Host"
  value       = aws_instance.bastion.public_ip
}
output "private_instance_ip" {
  value       = aws_instance.nginx.private_ip
  description = "The private IP of the nginx EC2 instance"
}
