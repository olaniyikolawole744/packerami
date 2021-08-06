resource "aws_instance" "server-prototype" {
  ami                    = var.ami
  instance_type          = var.instance-type
  key_name               = var.key-name
  availability_zone      = var.availability-zone
  vpc_security_group_ids = [var.security-group]
  user_data              = var.user-data
  tags = {
    //Name        = var.purpose
    Name        = "${var.purpose} server ${var.index}"
    Environment = var.environment
    Role        = var.role
  }
}


