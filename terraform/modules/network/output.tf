output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}
output "nsg_aks_id" {
  value = azurerm_network_security_group.nsg_aks.id
}
output "aks_subnet_id" {
  value = azurerm_subnet.aks.id
}