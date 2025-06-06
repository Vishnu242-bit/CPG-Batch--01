#creating 5 resources of type "aws_instance" using for_each
#resource "aws_instance" "web" {
 # for_each = toset(["web1", "web2", "web3", "web4", "web5"])

 # ami           = "ami-12345678" # Replace with a valid AMI ID
  #instance_type = "t2.micro"
  #tags = {
   # Name = each.value
  

#creating 5 resources of type "aws_instance" using count
#resource "aws_instance" "web_count" {
 # count = 5

  #ami           = "ami-12345678" # Replace with a valid AMI ID
  #instance_type = "t2.micro"
  #tags = {
   # Name = "web-${count.index + 1}"
  #}
#}



resource "azurerm_resource_group" "devstorage05" {
  name     = "devstorage05-rg"
  location = "East US"
}

resource "azurerm_storage_account" "devstorage50_count" {  
  count               = var.storage_count
  name                = "devstorage05${count.index}"
  resource_group_name = azurerm_resource_group.devstorage05.name
  location            = azurerm_resource_group.devstorage05.location
  account_tier        = "Standard"
  account_replication_type = "LRS"

  tags = {
    Name = "Storage-${count.index}"
  }
}

resource "azurerm_storage_account" "devstorage05_for_each" {
  for_each = toset(["storage1", "storage2", "storage3"])
  name                = each.value
  resource_group_name = azurerm_resource_group.devstorage05.name
  location            = azurerm_resource_group.devstorage05.location
  account_tier        = "Standard"
  account_replication_type = "LRS"

  tags = {
    Name = each.value
  }
}