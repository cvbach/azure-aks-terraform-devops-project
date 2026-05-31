variable "location" {
  type        = string
}
variable "resource_group_name" {
  type        = string
}
variable "vnet_name" {
  type        = string
}
#NSG
locals {
  nsg_common_rules = [
   
  ]
}