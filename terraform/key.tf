resource "aws_key_pair" "default" {
  key_name = "projeto3"
  public_key = "${file("${var.key_path}")}"
}
