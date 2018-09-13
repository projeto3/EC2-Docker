
resource "aws_instance" "projeto3" {
  ami           = "ami-04681a1dbd79675a5"
  instance_type = "t2.micro"
  key_name = "projeto3"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDaxJuIbOf9l7pA45QAAWGbEL1ie0ljXbQkkfQBseIrv4iBRurSTTEQihS/+tXx2fksMmGGWWoasywuvRNrYIqyyp0ZkIBWYgl7VxZz8UzMIYsq+jHEEeUmMmYZ6IP+stJV8o2+HBpnjPULozoJu4ceUHDHMQiGxvxKszmJwwx2WxiDUZKXs3zStLpEjwol6oClp+P9rj3V6HlVTeGk+UHEhz+eGgcAslgWpCwrD/ZJ/bHrqSVfXlGe0vsubE7KoVtiFmc67G9Nsv92vNXlY8KeIeHph0Yq0niPHlRZe1UecQ8HR+7pmyo13xAb25ajFenG5gOETSHjwOMROT6Va//P"
  #key_name = "${aws_key_pair.mykeypair.key_name}"
  subnet_id     = "${aws_subnet.main-public-1.id}"
  vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]
  associate_public_ip_address	= "true"
  #aws_security_group = "sg-0b70b9d3a1ae3add6"
  
  user_data = "${file("${path.module}/user_data.sh")}"

}
output "aws_ip" {
    value = "${aws_instance.projeto3.public_ip}"
}

output "aws_dns" {
    value = "${aws_instance.projeto3.public_dns}"
}
