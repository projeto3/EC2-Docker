  variable "PATH_TO_PRIVATE_KEY" {
  default = "/etc/ssh/projeto3.pem"
}

 variable "PATH_TO_PUBLIC_KEY" {
 default = "/etc/ssh/projeto.pub"
 }

variable "tags" {
  type = "map"
  default = {
    development = "bucket-dev"
    staging = "bucket-for-staging"
    preprod = "bucket-name-for-preprod"
    production = "bucket-for-production"
  }
}
