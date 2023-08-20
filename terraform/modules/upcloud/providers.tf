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
  username  = var.UPCLOUD_USERNAME
  password  = var.UPCLOUD_PASSWORD
  retry_max = 3
}
