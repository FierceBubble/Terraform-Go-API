terraform {
  required_version = ">= 0.13.0"
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = ">= 1.42.0"
    }
  }
}
