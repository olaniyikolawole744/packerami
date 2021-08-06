resource "aws_security_group" "toolbox-server2-sg" {
  name        = "toolbox-server2-sg"
  description = "Linux Server security Group"

  ingress {
    description = "Linux Server Inbound Rule"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Linux Server Inbound Rule"
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
    Name = "toolbox-server2-sg"
  }
}



