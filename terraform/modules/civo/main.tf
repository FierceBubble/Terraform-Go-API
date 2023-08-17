terraform {
  required_version = ">= 0.13.0"
  required_providers {
    civo = {
      source  = "civo/civo"
      version = ">= 1.0.35"
    }
  }
}

provider "civo" {
  token  = var.civo_token
  region = "LON1"
}
