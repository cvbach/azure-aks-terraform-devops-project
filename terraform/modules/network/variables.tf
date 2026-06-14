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
   {
     name     = "Allow-80"
     priority = 1001
     direction = "Inbound"
     access = "Allow"
     protocol = "Tcp"
     source_port_range = "*"
     destination_port_range = "80"
     source_address_prefix = "*"
     destination_address_prefix = "*"
   }
  ]
}