variable "sg_name" {
    default = "allow_ssh"
}

variable "sg_description" {
    default = "Allow port number 22 for SSH protocol connection"
}

variable "from_port" {
    default = "22"
    type = number
}

variable "to_port" {
    default = "22"
}

variable "protocol" {
    default = "tcp"
}

variable "ingress_cidr" {
    default = ["0.0.0.0/0"]
    type = list(string) 
}

variable "ami_id" {
    default = "ami-09c813fb71547fc4f"
    type = string
    description = "This is the AMI id of DevOps-Practice of RHEL-9"
}

variable "instance_type" {
    type = string
    default = "t3.micro"
}

variable "common_tags" {
    type = map
    default = {
        Environment = "dev"
        Project = "expense"
        Terraform = "true"
    }
}

variable "instance_names" {
    type = list(string)
    default = ["mysql", "backend", "frontend"]
}

variable "environment" {
    default = "prod"
}

variable "tags" {
    type = map
    default = {
        Environment = "DEV" 
        Terraform = "true"
        Project = "expense"
        Name = "terraform"
    }
}