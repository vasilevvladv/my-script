variable "gitlab_token" {
  type = string
  description = "Token gitlab"
	
}

variable "deploy_key" {
  type = string
  description = "Deploy key ssh"

}

variable "base_url" {
  type = string
  default = "https://gitlab.rebrainme.com/api/v4/"
  description = "This is the url to the Gitlab repository"
}


