
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
resource "digitalocean_droplet" "apple" {
  image  = "ubuntu-18-04-x64"
  name   = "web-1"
  region = "nyc1"
  size   = "s-1vcpu-1gb"
  tags = ["devops", var.e-mail]
  ssh_keys = [digitalocean_ssh_key.my_ssh_pub_key.fingerprint, data.digitalocean_ssh_key.rebrain_key.fingerprint]
}

output "ip4" {
    value = "${digitalocean_droplet.apple.ipv4_address}"
}

