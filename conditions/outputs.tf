output "public_ip" {
    value = aws_instance.terraform.public_ip
    sensitive = false
    description = "This is the puclic_ip of the created instance" 
}