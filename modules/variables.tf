variable "ami" {
  type = string
}

variable "instance-type" {
  type    = string
  default = "t2.micro"
}

variable "name" {
  type = string
}

variable "availability-zone" {
  type = string
}

variable "security-group" {
  type = string
  // default = "sg-09b0a6f9db17a627a"
  default = ""
}

variable "key-name" {
  type    = string
  default = "training_kp"
}

variable "environment" {
  type    = string
  default = "env"
}

variable "role" {
  type = string
}

variable "purpose" {
  type = string
}

variable "index" {
  type = string
}

variable "user-data" {
  type    = string
  default = ""
}