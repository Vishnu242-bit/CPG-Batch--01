# Dependencies 

# Implicit Dependency - It is resource referencing in your own code
# Explicit Dependency - Adding a specific Dependency as per user decision

resource "azurerm_resource_group" "state01" {
    name = var.rg_name
    location = "southindia"
}

resource "azurerm_network_interface" "dev01_vm_nic" {
    name = var.dev01_vm_nic_name
    resource_group_name = azurerm_resource_group.rg02.name
    location = azurerm_resource_group.rg02.location

    ip_configuration {
        name = "dev-hdfc-app-vm-nic-ip-01"
        subnet_id = azurerm_subnet.dev01.id
        private_ip_address_allocation = "Dynamic"
    }
}

resource "azurerm_network_interface" "dev_vm_nic" {
    name = "var.dev_vm_nic_name"
    resource_group_name = "azurerm_resource_group.rg02.name"
    location = "azurerm_resource_group.rg02.location"

    ip_configuration {
        name = "dev-hdfc-app-vm-nic-ip-01"
        subnet_id = azurerm_subnet.dev01.id
        private_ip_address_allocation = "Dynamic"
    }
}


resource "azurerm_windows_virtual_machine" "dev_vm" {
    name = var.name
    resource_group_name = azurerm_resource_group.state01.name
    location = "eastus2" #   azurerm_resource_group.state01.location
    size = var.size   #"standard_d2s_v3" #   #As per the Architecture we should keep the size to standard_d2s_v2 only
    admin_username = var.admin_username
    computer_name   = var.computer_name
    admin_password = var.admin_password
    network_interface_ids = [azurerm_network_interface.dev_vm_nic.id]

    source_image_reference {
        publisher = "MicrosoftWindowsServer"
        offer = "WindowsServer"
        sku = "2016-Datacenter"
        version = "latest"
    }

    os_disk {
       name =   "dev-hdfc-app-vm-os-disk-01"
       disk_size_gb = var.disk_size_gb
       caching = "ReadWrite"
       storage_account_type = "StandardSSD_LRS"
    }

    tags = {
        Environment = "testing"
    }
}

resource "azurerm_windows_virtual_machine" "dev01_vm" {
    name = var.dev01_vm_name
    resource_group_name = azurerm_resource_group.state01.name
    location = "eastus2" #   azurerm_resource_group.state01.location
    size = var.dev01_vm_size   #"standard_d2s_v3" #   #As per the Architecture we should keep the size to standard_d2s_v2 only
    admin_username = var.admin_username
    computer_name   = var.dev01_computer_name
    admin_password = var.admin_password
    network_interface_ids = [azurerm_network_interface.dev01_vm_nic.id]

    source_image_reference {
        publisher = "MicrosoftWindowsServer"
        offer = "WindowsServer"
        sku = "2016-Datacenter"
        version = "latest"
    }

    os_disk {
       name =   "dev-hdfc-app-vm-os-disk-01"
       disk_size_gb = var.disk_size_gb
       caching = "ReadWrite"
       storage_account_type = "StandardSSD_LRS"
    }

    tags = {
        Environment = "testing"
    }
}