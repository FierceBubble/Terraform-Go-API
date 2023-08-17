terraform {
  required_version = ">= 0.13.0"
  required_providers {
    vultr = {
      source  = "vultr/vultr"
      version = ">= 2.15.1"
    }
  }
}

provider "vultr" {
  api_key     = var.vultr_api_key
  rate_limit  = 100
  retry_limit = 3
}

resource "vultr_instance" "my_instance" {
  plan             = var.vultr_instance_plan
  region           = var.vultr_instance_region
  os_id            = var.vultr_instance_os
  label            = var.vultr_instance_label
  tags             = var.vultr_instance_tags
  hostname         = var.vultr_instance_hostname
  enable_ipv6      = var.vultr_instance_enable_ipv6
  backups          = var.vultr_instance_backups
  ddos_protection  = var.vultr_instance_ddos_protection
  activation_email = var.vultr_instance_activation_email
  # backups_schedule {
  #   type = var.vultr_instance_backups_schedule_type
  # }
}
