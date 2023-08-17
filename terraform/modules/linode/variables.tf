# - - -- - Linode Variables - - - - - #
variable "linode_token" {
  sensitive = true
}

# Instance
variable "linode_instance_label" {}
variable "linode_instance_image" {}
variable "linode_instance_region" {}
variable "linode_instance_type" {}
variable "linode_instance_authorized_users" {}
variable "linode_instance_root_password" {}
variable "linode_instance_group" {}
variable "linode_instance_tags" {}
variable "linode_instance_swap_size" {}
variable "linode_instance_private_ip" {}
