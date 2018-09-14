  variable "private_key_path" {
  default = "/etc/ssh/projeto3.pem"
}

 variable "public_key_path" {
 default = ""
 }
variable "key_path" {
  description = "SSH Public Key path"
  default = "~/.ssh/id_rsa.pub"
}
