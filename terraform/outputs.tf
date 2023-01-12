output "ubuntu_instance_ip" {
  value = aws_instance.my_ubuntu.public_ip
}

output "amazon_linux_instance_ip" {
  value = aws_instance.my_amazon.public_ip
}