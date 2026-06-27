resource "azurerm_data_protection_backup_vault" "backup" {
  name                = "backup-vault-devops"
  location            = var.location
  resource_group_name = var.resource_group_name

  datastore_type = "VaultStore"

  redundancy = "LocallyRedundant"
}

resource "azurerm_data_protection_backup_policy_kubernetes_cluster" "policy" {

  name                = "daily-backup-policy"
  vault_name          = azurerm_data_protection_backup_vault.backup.name   
  resource_group_name = var.resource_group_name

  backup_repeating_time_intervals = [
    "R/2026-01-01T02:00:00+00:00/P1D"
  ]

  default_retention_rule {
    life_cycle {
      duration        = "P7D"
      data_store_type = "VaultStore"
    }
  }
}
