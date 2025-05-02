locals {
    zone_id = "Z09654101CXVBN7HDWZ5Y"
    domain_name = "ram4india.space"
    instance_type = var.environment == "prod" ? "t3.micro" : "t3.small"
}

#count.index won't work in locals concept
#locals can store conditional expressions and run them and execute
#locals can't be overwitten like variable 
#locals can refer variable but variables can't refer locals 