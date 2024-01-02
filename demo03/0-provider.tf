provider "digitalocean" {
  # Our DigitalOcean token. Taken from our variables
  token = var.do_token
}

terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
}

