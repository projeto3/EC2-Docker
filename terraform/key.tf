resource "aws_key_pair" "default" {
  #public_key = "${file("${var.key_path}")}"
  public_key = var.key_path
}
