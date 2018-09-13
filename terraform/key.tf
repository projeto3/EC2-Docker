resource "aws_key_pair" "mykeypair" {
 # key_name = "projeto3"
  public_key = "${file("${var.public_key_path}")}"
}
