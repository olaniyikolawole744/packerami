data "aws_ami" "linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["my-linux-ami"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["self"]
}

data "template_file" "toolbox2-bootstrap" {
  template = file("${path.module}/${"toolbox2-bootstrap"}.txt")
}


