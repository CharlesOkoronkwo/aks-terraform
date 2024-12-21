variable "resource_group_name" {
  type        = string
  description = "Azure resource group name"
  default = "aks_rg1"
}
variable "location" {
  type        = string
  description = "location of the resources in Azure"
  default = "East US"
}
variable "cluster_name" {
  type        = string
  description = "AKS name in Azure"
  default = "my-aks-cluster"
}
variable "kubernetes_version" {
  type        = string
  description = "Kubernetes version"
  default = "1.30.6"
}
variable "system_node_count" {
  type        = number
  description = "Number of AKS worker nodes"
  default = 2
}
variable "acr_name" {
  type        = string
  description = "ACR name"
  default = "myacr432123"
}