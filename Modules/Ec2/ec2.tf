resource "aws_security_group" "S7s_SG" {
  name        = "S7s_SG"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = var.vpc_id
    ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
  tags = {
    Name = "S7S-SG"

  }
}

resource "aws_instance" "inst" {
  ami                         = var.ami
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.S7s_SG.id]
  subnet_id                   = var.public_subnet_id
  associate_public_ip_address = true
  tags = {
    Name = "S7s_Ec2"
  }
}


