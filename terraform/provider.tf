
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.74.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "6f5f4050-50e7-47b8-a834-65da592adec8"
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "stv2tfstate"
    container_name       = "tfstate"
    key                  = "aks-devops-project.tfstate"
    use_oidc = true
  }
}