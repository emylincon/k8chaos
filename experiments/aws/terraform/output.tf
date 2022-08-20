output "ec2_ip" {
  description = "ec2 public IP address"
  value       = aws_instance.web.public_ip
}
