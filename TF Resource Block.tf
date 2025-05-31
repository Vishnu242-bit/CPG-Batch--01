resource "azurerm_resource_group" "dev01-rg02" {
  name     = "rg-dev-hdfc-bank"
  location = "West Europe"
}

resource "azurerm_virtual_network" "dev01-vnet" {
  name                = "dev-hdfc-bank-vnet-01"
  address_space       = ["10.0.0.0/16"]
  location            = "West Europe"
  resource_group_name = "rg-dev-hdfc-bank"
  dns_servers        = ["192.168.0.1", "172.0.0.0", "10.0.0.0"]
}
    
resource "azurerm_subnet" "dev01-subnet" {
  name                 = "dev-hdfc-bank-vnet-01-subnet-01"
  resource_group_name  = azurerm_resource_group.dev01-rg02.name
  virtual_network_name = azurerm_virtual_network.dev01-vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}
resource "azurerm_resource_group" "dev01-rg" {
  name     = "rg-dev-hdfc-bank"
  location = "West Europe"
}
resource "azurerm_storage_account" "stg01" {
  name                     = "tfstate"
  resource_group_name      = azurerm_resource_group.dev01-rg.name
  location                 = azurerm_resource_group.dev01-rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.stg01.name
  container_access_type = "private"
}
resource "azurerm_storage_blob" "tfstate" {
  name                   = "terraform.tfstate"
  storage_account_name   = azurerm_storage_account.stg01.name
  storage_container_name = azurerm_storage_container.tfstate.name
  type                   = "Block"
  source                 = "terraform.tfstate"
}

