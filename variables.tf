# Input Variables
/*

The Input variables will be served as a Dynamic values, 
Re-usable code --> 


Template
name: 
DOB : 
PLACE : 
EDUCATION : 
OCCUPATION : 




*/




# This is the default Syntax for the variable  dev_vm



# variable "" {
#   description = ""
#   type = 
#   default = 
# }

//"dev-hdfc-demo-app-vm-01" and "prod-hdfc-app-vm-01"


variable "name" {
  description = "this is vm name"
  type = string
  default = "dev-hdfc-demo-app-vm-01"
}

variable "size" {
  description = "VM Size"
  type = string
  default = "Standard_B4ls_v2"  #"Standard_D2s_v5" 
}

variable "admin_username" {
  description = "(Required) The username of the local administrator used for the Virtual Machine. Changing this forces a new resource to be created."
  type = string
  default = "rinkesh"
}

variable "disk_size_gb" {
  description = " (Optional) The Size of the Internal OS Disk in GB, if you wish to vary from the size used in the image this Virtual Machine is sourced from."
  type = number
  default = 512
}

variable "computer_name" {
  description = "(Optional) Specifies the Hostname which should be used for this Virtual Machine. If unspecified this defaults to the value for the name field. If the value of the name field is not a valid computer_name, then you must specify computer_name. Changing this forces a new resource to be created."
  type = string
  default = "hdfc-app-vm-01"
}

variable "rg_name" {
  description = "RG name"
  type = string
  default = "demo-state-01"
}

variable "dev01_vm_nic_name" {
  description = "nic name"
  type =string
  default = "dev-hdfc-demo-app-vm-nic-01"
}

variable "dev_vm_nic_name" {
  description = "nic name"
  type =string
  default = "dev-hdfc-demo-app-vm-nic-01"
}

variable "admin_password" {
  description = "adming vm passwrod"
  type = string
  default = "ri8765IUGB@#@kfn"
}