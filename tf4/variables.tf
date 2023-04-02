variable "do_token" {
    type = string
    description = "Token digitalocean"
}
variable "ssh_key" {
    type = string
    description = "My ssh pub key"

}

variable "e-mail" {
    type = string
    default = "vasilevvladv_at_mail_ru"
    description = "E-mail"
}

variable "aws-access-key" {
    type = string
    description = "AWS access key"
}
variable "aws-secret-key" {
    type = string
    description = "AWS secret key"
}

variable "icount" {
    type = number
    default = 2
    description = "amount of resources"
}

