  variable "PATH_TO_PRIVATE_KEY" {
  default = "/etc/ssh/projeto3.pem"
}

 variable "PATH_TO_PUBLIC_KEY" {
 default = "/etc/ssh/projeto.pub"
 }
  variable "tags" {
    description = "A map of tags to add to all resources"
    default     = {
      name = "${$BUILD_TAG}"
      commit = "{$GIT_COMMIT}"
      Build = "{$BUILD_DISPLAY_NAME}"
    
      }
  }


