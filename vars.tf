variable "instance_ami" {
  description = "Value of the image to be used for instance"
  type        = string
  default     = "ami-08c40ec9ead489470"
  #default     = "ami-06640050dc3f556bb"
}

variable "instance_keypair" {
  description = "Value of the key pair to be used"
  type        = string
  default     = "first-key-pair"
}

variable "instance_type" {
  description = "Value of the ec2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "load_balancer_type" {
  description = "Value of the LB type"
  type        = string
  default     = "application"
}

variable "aws_region" {
  description = "Value of the LB type"
  type        = string
  default     = "us-east-1"
}

