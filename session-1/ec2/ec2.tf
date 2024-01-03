resource "aws_instance" "web" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.roboshop-all.id]

  tags = {
    Name = "Hello Terraform"
  }
}

resource "aws_security_group" "roboshop-all" {
  name        = var.sg-name
  description = var.sg-description
  #vpc_id      = aws_vpc.main.id

  ingress {
    description      = "allow all ports"
    from_port        = var.inbound-from-port
    to_port          = 0
    protocol         = "tcp"
    cidr_blocks      = var.cidr-blocks
    #ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    #ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "roboshop-all"
  }

} 