# - - -- - Vultr Variables - - - - - #
variable "vultr_api_key" {
  sensitive = true
}

# Instance
variable "vultr_instance_plan" {}
variable "vultr_instance_region" {}
variable "vultr_instance_os" {}
variable "vultr_instance_label" {}
variable "vultr_instance_tags" {}
variable "vultr_instance_hostname" {}
variable "vultr_instance_enable_ipv6" {}
variable "vultr_instance_backups" {}
variable "vultr_instance_ddos_protection" {}
variable "vultr_instance_activation_email" {}

# Instance Backups Schedule
variable "vultr_instance_backups_schedule_type" {}
