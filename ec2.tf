resource "aws_security_group" "app_sg_new" {
  name        = "app-sg-new"
  description = "Allow 22 and 80"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "app_ec2" {
  ami           = "ami-0e001c9271cf7f3b9"
  instance_type = "t2.micro"
  key_name      = var.key_name
  iam_instance_profile = aws_iam_instance_profile.upload_profile.name
  vpc_security_group_ids = [aws_security_group.app_sg_new.id]
  user_data     = file("startup.sh")

  tags = {
    Name = "AppEC2-${var.env_name}"
  }
}
