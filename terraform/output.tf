output "public-ip" {
  value = "${aws_eip.ip.public_ip}"
}
