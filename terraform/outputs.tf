output "ubuntu_instance_ip" {
  value = aws_instance.my_ubuntu.public_ip
}
