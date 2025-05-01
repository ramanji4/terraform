#VARIABLE PREFERENCES
  #1.Command line arguments
  #2.terraform.tfvars
  #3.environmental variables  (export TF_VAR_instance_type=t3.micro)
  #4.default variables
  #5.prompting 



resource "aws_security_group" "allow_ssh_connection" {
  name        = var.sg_name
  description = var.sg_description
  
  egress {      #egress is outgoing traffic
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {      #ingress is incoming traffic to the server
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = var.protocol
    cidr_blocks      = var.ingress_cidr  #allow from everyone 
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = var.tags
}


resource "aws_instance" "terraform" {
  ami           = var.ami_id
  instance_type = var.environment == "prod" ? "t3.small" : "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_ssh_connection.id]
  tags = var.tags
}