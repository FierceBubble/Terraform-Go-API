# - - - - - Azure Variables - - - - - #
variable "azure_subscription_id" {
  sensitive = true
}
variable "azure_tenant_id" {
  sensitive = true
}

# - - - - - Azure Resource Group Variables - - - - - #
variable "azure_rg_name" {
  description = "Azure RG name"
}

variable "azure_rg_location" {
  description = "Azure RG location (Region)"
}

# - - - - - Azure VM Variables - - - - - #
variable "azure_vm_name" {
  type        = string
  description = "Azure VM name"
}

variable "azure_vm_host_name" {
  type        = string
  description = "Azure VM host name"
}

variable "azure_vm_size" {
  description = "Azure VM size"
}

variable "azure_vm_disable_password" {
  description = "Azure VM disable password"
  default     = "false"
}

variable "azure_admin_username" {
  type        = string
  nullable    = false
  description = "Admin username to VM"
}

variable "azure_admin_password" {
  type        = string
  nullable    = false
  description = "Admin password to VM"
  sensitive   = true
}

variable "azure_vm_os_disk_type" {
  description = "Azure VM OS Disk type"
}

variable "azure_vm_os_disk_caching" {
  description = "Azure VM OS Disk caching option"
}

variable "azure_vm_os_disk_size" {
  type        = number
  description = "Azure VM OS Disk size (GB)"
}

variable "azure_vm_image_publisher" {
  description = "Azure VM Image Publisher"
}

variable "azure_vm_image_offer" {
  description = "Azure VM Image Offer"
}

variable "azure_vm_image_sku" {
  description = "Azure VM Image SKU"
}

variable "azure_vm_image_version" {
  description = "Azure VM Image Version"
}

# - - - - - Dynamic Variables - - - - - #
