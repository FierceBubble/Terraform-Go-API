terraform {
  required_version = ">= 0.13.0"
  required_providers {
    upcloud = {
      source  = "UpCloudLtd/upcloud"
      version = ">= 2.12.0"
    }
  }
}


provider "upcloud" {
  username  = var.upcloud_username
  password  = var.upcloud_password
  retry_max = 3
}

resource "upcloud_server" "upcloud_vm" {
  hostname = var.upcloud_server_hostname
  zone     = var.upcloud_server_zone
  plan     = var.upcloud_server_plan

  # Declare network interfaces
  network_interface {
    type = var.upcloud_server_nic_type
  }

  # Include at least one public SSH key
  login {
    user              = var.upcloud_server_user
    create_password   = var.upcloud_server_create_password
    password_delivery = var.upcloud_server_password_delivery
  }

  # Provision the server with Ubuntu
  template {
    storage = var.upcloud_server_template_storage

    # Use all the space allotted by the selected simple plan
    size = var.uplcoud_server_template_size

    # Enable backups
    backup_rule {
      interval  = var.upcloud_server_template_backup_interval
      time      = var.upcloud_server_template_backup_time
      retention = var.upcloud_server_template_backup_retention
    }
  }
}
