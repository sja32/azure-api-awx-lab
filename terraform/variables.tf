variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
  default     = "rg-api-awx-lab"
}

variable "vnet_name" {
  description = "Virtual network name"
  type        = string
  default     = "vnet-api-awx-lab"
}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
  default     = "snet-api"
}

variable "nsg_name" {
  description = "NSG name"
  type        = string
  default     = "nsg-api-awx-lab"
}

variable "public_ip_name" {
  description = "Public IP name"
  type        = string
  default     = "pip-api-awx-lab"
}

variable "nic_name" {
  description = "NIC name"
  type        = string
  default     = "nic-api-awx-lab"
}

variable "vm_name" {
  description = "VM name"
  type        = string
  default     = "vm-api-awx-lab"
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  default     = "azureuser"
}

variable "your_public_ip" {
  description = "Your home public IP in CIDR format for SSH/HTTP access"
  type        = string
}