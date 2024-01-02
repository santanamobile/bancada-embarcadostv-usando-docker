resource "digitalocean_droplet" "yocto" {
  #count    = var.droplet_count
  image    = var.image
  #name     = "yocto-${var.name}-${var.region}-${count.index + 1}"
  name     = "yocto-${var.name}-${var.region}"
  region   = var.region
  size     = var.droplet_size
  ssh_keys = [data.digitalocean_ssh_key.main.id]
  tags = ["${var.name}-yocto", "embarcados", "dockerdemo"]

  user_data = file("bootstrap.sh")

  lifecycle {
    create_before_destroy = true
  }
}

resource "digitalocean_firewall" "yocto" {
  # Human friendly name of the firewall
  name = "${var.name}-firewall-rule"

  droplet_ids = digitalocean_droplet.yocto.*.id

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
/*
  #####
  # For Icecream
  inbound_rule {
    protocol         = "tcp"
    port_range       = "10245"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
  inbound_rule {
    protocol         = "tcp"
    port_range       = "8765"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
  inbound_rule {
    protocol         = "tcp"
    port_range       = "8766"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "udp"
    port_range       = "8765"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
*/
  ##########
  outbound_rule {
    protocol              = "tcp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "udp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "icmp"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}
