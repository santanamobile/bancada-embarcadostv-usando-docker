variable "do_token" {}

variable "ssh_key" {
  type = string
}
/*
variable "subdomain" {
  type = string
}

variable "domain_name" {
  type = string
}
*/

variable "name" {
  type    = string
  default = "vpc-embarcados"
}

variable "region" {
  type    = string
  default = "nyc1"
}

# # The number of droplets to create.
# variable "droplet_count" {
#   type    = number
#   default = 1
# }

# The size we want our droplets to be. 
# Can view slugs (valid options) https://slugs.do-api.dev/
variable "droplet_size" {
  type    = string
  default = "s-1vcpu-512mb-10gb"
}

# The operating system image we want to use. 
# Can view slugs (valid options) https://slugs.do-api.dev/
variable "image" {
  type = string
  # default = "ubuntu-20-04-x64"
  default = "debian-11-x64"
  # default = "debian-10-x64"
}
