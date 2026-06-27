resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "dns-aks"
  sku_tier = "Free"
  workload_identity_enabled = true
  oidc_issuer_enabled       = true
  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
    vnet_subnet_id = var.aks_subnet_id
  }
  network_profile {
  network_plugin      = "azure"
  network_plugin_mode = "overlay"

  service_cidr   = "172.16.0.0/16"
  dns_service_ip = "172.16.0.10"
  pod_cidr       = "192.168.0.0/16"
 }
  identity {
    type = "SystemAssigned"
  }
  oms_agent {
  log_analytics_workspace_id = var.log_analytics_workspace_id
}
}

