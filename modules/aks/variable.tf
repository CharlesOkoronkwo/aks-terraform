variable "resource_group_name" {
  type        = string
  description = "Azure resource group name"
  
}
variable "location" {
  type        = string
  description = "location of the resources in Azure"
  
}
variable "cluster_name" {
  type        = string
  description = "AKS name in Azure"
  
}
variable "kubernetes_version" {
  type        = string
  description = "Kubernetes version"
  
}
variable "system_node_count" {
  type        = number
  description = "Number of AKS worker nodes"
  
}
# variable "acr_name" {
#   type        = string
#   description = "ACR name"
#   default = "myacr432123"
# }