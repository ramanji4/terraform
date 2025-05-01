output "instances_info" {
    value = aws_instance.expense
}

#we can use both declarations as inputs to create other AWS resources
#output.instances_info == aws_instance.expense