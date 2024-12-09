module "aks" {
  source              = "./modules/aks"
  cluster_name        = var.cluster_name
  resource_group_name = var.resource_group_name
  location            = var.location
  system_node_count   = var.system_node_count
  acr_name            = var.acr_name
  kubernetes_version  = var.kubernetes_version
}
