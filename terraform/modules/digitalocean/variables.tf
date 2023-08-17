# - - -- - Digital Ocean Variables - - - - - #
variable "digitalocean_token" {
  sensitive = true
}
variable "digitalocean_ssh_key" {}

# Volume
variable "do_volume_name" {}
variable "do_volume_region" {}
variable "do_volume_size" {}
variable "do_volume_description" {}
variable "do_volume_tags" {
  type = list(string)
}
variable "do_volume_filesystem_type" {}
variable "do_volume_filesystem_label" {}

# Droplet
variable "do_droplet_name" {}
variable "do_droplet_tags" {
  type = list(string)
}
variable "do_droplet_image" {}
variable "do_droplet_region" {}
variable "do_droplet_size" {}
variable "do_droplet_ipv6" {}
variable "do_droplet_monitoring" {}
variable "do_droplet_backups" {}
