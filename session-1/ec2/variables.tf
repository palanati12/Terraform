variable  "sg-name" {
   type = string
   default = "robosop-all"
}  

variable "sg-description" {
   type =  string
   default = "Allow roboshop inbound traffic"
}

variable "inbound-from-port" {
   #type =  "string"
   default = 0
}

variable "cidr-blocks" {
   type = list  
   default = ["0.0.0.0/0"]
}

