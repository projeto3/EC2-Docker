output "public-ip" {
  value = "${aws_ec2.ip.public_ip}"
}
