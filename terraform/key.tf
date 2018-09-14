resource "aws_key_pair" "mykeypair" {
  key_name = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
  public_key = "${file("${var.public_key_path}")}"
}
