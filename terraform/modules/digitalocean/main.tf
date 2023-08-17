terraform {
  required_version = ">= 0.13.0"
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = ">= 2.29.0"
    }
  }
}

provider "digitalocean" {
  token = var.digitalocean_token
}

data "digitalocean_ssh_key" "ssh-key" {
  name = var.digitalocean_ssh_key
}

resource "digitalocean_droplet" "droplet" {
  name       = var.do_droplet_name
  tags       = var.do_droplet_tags
  image      = var.do_droplet_image
  region     = var.do_droplet_region
  size       = var.do_droplet_size
  ipv6       = var.do_droplet_ipv6
  monitoring = var.do_droplet_monitoring
  backups    = var.do_droplet_backups

  ssh_keys = [
    data.digitalocean_ssh_key.ssh-key.id
  ]
}

resource "digitalocean_volume" "volume" {
  name        = var.do_volume_name
  region      = var.do_volume_region
  size        = var.do_volume_size
  description = var.do_volume_description
  tags        = var.do_volume_tags

  initial_filesystem_type  = var.do_volume_filesystem_type
  initial_filesystem_label = var.do_volume_filesystem_label
}

resource "digitalocean_volume_attachment" "volume-attachment" {
  droplet_id = digitalocean_droplet.droplet.id
  volume_id  = digitalocean_volume.volume.id
}
