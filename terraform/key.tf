resource "aws_key_pair" "default" {
  private_key = "${file("${var.key_path_private}")}"
  public_key = "${file("${var.key_path}")}"
}
