  variable "PATH_TO_PRIVATE_KEY" {
  default = "/etc/ssh/projeto3.pem"
}

 variable "PATH_TO_PUBLIC_KEY" {
 default = "/etc/ssh/projeto.pub"
 }
    variable "instance_name" {
  description = "Used to populate the Name tag. This is done in main.tf"
      nome = "${aws_instance.projeto3.public_dns}"
}

variable "instance_type" {}

variable "subnet_id" {
  description = "The VPC subnet the instance(s) will go in"
}

variable "ami_id" {
  description = "The AMI to use"
}

variable "number_of_instances" {
  description = "number of instances to make"
  default = 1
}

variable "user_data" {
  description = "The path to a file with user_data for the instances"
}

variable "tags" {
  default = {
    created_by = "terraform"
 }
}


