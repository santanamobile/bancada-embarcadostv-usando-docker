output "yocto_servers_public" {
  value = digitalocean_droplet.yocto.*.ipv4_address
}

