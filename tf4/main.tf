terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_ssh_key" "my_ssh_pub_key" {
    name = "VVA"
    public_key = var.ssh_key
}

data "digitalocean_ssh_key" "rebrain_key" {
    name = "REBRAIN.SSH.PUB.KEY"
  
}

# Create a server
resource "digitalocean_droplet" "apples" {
  count = var.icount
  image  = "ubuntu-18-04-x64"
  name   = "web-${count.index + 1}"
  region = "nyc1"
  size   = "s-1vcpu-1gb"
  tags = ["devops", var.e-mail, var.icount]
  ssh_keys = [digitalocean_ssh_key.my_ssh_pub_key.fingerprint, data.digitalocean_ssh_key.rebrain_key.fingerprint]
}


locals {
  do_web-1_ip4 = digitalocean_droplet.apples.*.ipv4_address
}

provider "aws" {
 # region = "eu-west-1"
  region = "us-east-1"
  access_key = var.aws-access-key
  secret_key = var.aws-secret-key
}

data "aws_route53_zone" "selected" {
  name = "devops.rebrain.srwx.net"
}

resource "aws_route53_record" "aws_dns_do" {
  count = var.icount
  zone_id = data.aws_route53_zone.selected.zone_id
  name  = "vasilevvladv-${count.index + 1}.${data.aws_route53_zone.selected.name}"
  type = "A"
  ttl = "300"
  records = [element (local.do_web-1_ip4 , count.index)]
  
}

output "ip4" {
    value = digitalocean_droplet.apples.*.ipv4_address
}
