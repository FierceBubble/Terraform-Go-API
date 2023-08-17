# - - -- - UpCloud Variables - - - - - #
variable "upcloud_username" {}
variable "upcloud_password" {
  sensitive = true
}

# Server Variables
variable "upcloud_server_hostname" {}
variable "upcloud_server_zone" {}
variable "upcloud_server_plan" {}

# Server Login Variables
variable "upcloud_server_user" {}
variable "upcloud_server_create_password" {}
variable "upcloud_server_password_delivery" {}

# NIC Variables
variable "upcloud_server_nic_type" {}

# Tamplate (Storage)
variable "upcloud_server_template_storage" {}
variable "uplcoud_server_template_size" {}

# Template (Storage Backup)
variable "upcloud_server_template_backup_interval" {}
variable "upcloud_server_template_backup_time" {}
variable "upcloud_server_template_backup_retention" {}
