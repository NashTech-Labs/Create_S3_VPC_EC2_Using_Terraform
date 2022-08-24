variable sub{
type=string
}

variable sub2{
type=string
}

variable sub3{
type=string
}

resource "aws_instance" "proj-instance" {
  ami           ="ami-2757f631"
  instance_type = "t2.micro"
    key_name= "aws_key"
    iam_instance_profile = var.sub2
#    vpc_subnet_id = var.sub3
#    vpc_security_group_ids = [aws_security_group.proj-sg.id]
#    associate_public_ip_address = true
  tags = {
    Name = "Proj-Instance"
  }
}

resource "aws_security_group" "proj-sg" {
  name = "Proj-sg"
  vpc_id = var.sub
 ingress                = [
   {
     cidr_blocks      = [ "0.0.0.0/0"]
     description      = ""
     from_port        = 22
     ipv6_cidr_blocks = []
     prefix_list_ids  = []
     protocol         = "tcp"
     security_groups  = []
     self             = false
     to_port          = 22
  }
  ]
  egress = [
    {
      cidr_blocks      = [ "0.0.0.0/0"]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]
}
