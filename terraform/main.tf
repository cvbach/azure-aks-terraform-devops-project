# get resource group cv.bach 
data "azurerm_resources" "cvbach" {
  resource_group_name = "cv.bach"
}

module "network" {
  source              = "./modules/network"
  location            = var.region
  resource_group_name = data.azurerm_resources.cvbach.resource_group_name
  vnet_name           = var.vnet_name
}

module "acr" {
  source              = "./modules/acr"
  location            = var.region
  resource_group_name = data.azurerm_resources.cvbach.resource_group_name
  acr_name           = var.acr_name
}

module "aks" {
  source              = "./modules/aks"
  location            = var.region
  resource_group_name = data.azurerm_resources.cvbach.resource_group_name
  aks_name            = var.aks_name
  aks_subnet_id       = module.network.aks_subnet_id
}

module "backup" {
  source = "./modules/backup"

  location            = var.region
  resource_group_name = data.azurerm_resources.cvbach.resource_group_name
}

# az aks get-credentials --resource-group cv.bach --name aks-devops-project --overwrite-existing
# kubectl get nodes
# kubectl get pods -A

# docker build -t flask-aks:v1 .
# docker run -p 5000:5000 flask-aks:v1

# az acr login --name acrdevopsproject
# docker tag flask-aks:v1 acrdevopsproject.azurecr.io/flask-aks:v1
# docker push acrdevopsproject.azurecr.io/flask-aks:v1