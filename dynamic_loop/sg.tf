resource "aws_security_group" "allow_ssh_connection" {
  name        = "allow_ssh"
  description = "Allow multiple port numbers for multiple protocol connections"
  
  egress {      #egress is outgoing traffic
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  dynamic "ingress" { 
    for_each = var.ingress_rules
    content {
        from_port        = ingress.value.from_port
        to_port          = ingress.value.to_port
        protocol         = ingress.value.protocol
        cidr_blocks      = ingress.value.cidr_blocks 
        description      = ingress.value.description
    }  
  }

  tags = {
    Name = "allow_ssh"
  }
}