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
  token = var.DIGITALOCEAN_TOKEN
}
