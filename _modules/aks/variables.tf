variable "location" {
  type        = string
  default     = "uksouth"
  description = "Location of the resource group."
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group."
}

variable "cluster_name" {
  type        = string
  description = "AKS cluster name"
}

variable "dns_zone_id" {
  type = string
}
