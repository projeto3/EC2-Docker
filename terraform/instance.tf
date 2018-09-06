
resource "aws_instance" "projeto3" {
  ami           = "ami-04681a1dbd79675a5"
  instance_type = "t2.micro"
 #key_name = "projeto3"
  key_name = "${aws_key_pair.mykeypair.key_name}"
  subnet_id     = "${aws_subnet.main-public-1.id}"
  vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]
  associate_public_ip_address	= "true"
  #aws_security_group = "sg-0b70b9d3a1ae3add6"
  
  user_data = "${file("${path.module}/user_data.sh")}"
     
        tags {
        created_by = "${lookup(var.tags,"created_by")}"
            // Takes the instance_name input variable and adds
            //  the count.index to the name., e.g.
            //  "example-host-web-1"
            Name = "${var.instance_name}-${count.index}"
    }
}
output "aws_ip" {
    value = "${aws_instance.projeto3.public_ip}"
}

output "aws_dns" {
    value = "${aws_instance.projeto3.public_dns}"
}
