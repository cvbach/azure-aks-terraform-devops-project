resource "azurerm_data_protection_backup_vault" "backup" {
  name                = "backup-vault-devops"
  location            = var.location
  resource_group_name = var.resource_group_name

  datastore_type = "VaultStore"

  redundancy = "LocallyRedundant"
}