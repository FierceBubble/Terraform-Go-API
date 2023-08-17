terraform {
  required_version = ">= 0.13.0"
  required_providers {
    linode = {
      source  = "linode/linode"
      version = ">= 1.16.1"
    }
  }
}

provider "linode" {
  token = var.linode_token
}


resource "linode_instance" "server" {
  label            = var.linode_instance_label
  image            = var.linode_instance_image
  region           = var.linode_instance_region
  type             = var.linode_instance_type
  authorized_users = var.linode_instance_authorized_users
  root_pass        = var.linode_instance_root_password

  group      = var.linode_instance_group
  tags       = var.linode_instance_tags
  swap_size  = var.linode_instance_swap_size
  private_ip = var.linode_instance_private_ip
}
