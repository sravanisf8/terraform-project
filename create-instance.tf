# create the ec2 instance in subnet-1a

resource "aws_instance" "backend" {
  ami           = var.instance_ami
  key_name      = var.instance_keypair
  instance_type = var.instance_type
  subnet_id     = aws_subnet.publicsubnet-1.id
  vpc_security_group_ids = [aws_security_group.allow_22_80.id]
  # security_groups = ["security_demo_port"]
  tags = {
    Name            = "terraform provided ec2 backend server"
    App             = "backend"
    Technical-Owner = "Sravani"
  }
}

# create the ec2 instance in subnet-1b

resource "aws_instance" "jump-server" {
  ami           = var.instance_ami
  key_name      = var.instance_keypair
  instance_type = var.instance_type
  subnet_id     = aws_subnet.privatesubnet-2.id
  vpc_security_group_ids = [aws_security_group.allow_22_80.id]
  # security_groups = ["security_demo_port"]
  tags = {
    Name            = "terraform provided ec2 jump server"
    App             = "jumpserver"
    Technical-Owner = "Sravani"
  }
}
