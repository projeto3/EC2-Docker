
resource "aws_instance" "projeto3" {
  ami           = "ami-6871a115"
  instance_type = "t2.micro"
  subnet_id     = "subnet-04ddf27ca8d47df64"
  key_name	    = "projeto3"
  user_data     = yum -y update yum install epel-release -y yum install ansible git -y
}
