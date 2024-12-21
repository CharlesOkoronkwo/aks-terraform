module "aks" {
  source              = "./modules/aks"
  cluster_name        = var.cluster_name
  resource_group_name = var.resource_group_name
  location            = var.location
  system_node_count   = var.system_node_count
  # acr_name            = var.acr_name
  kubernetes_version  = var.kubernetes_version
}



resource "kubernetes_namespace" "youtube_clone" {
  metadata {
    name = "youtube-clone"
  }
}

resource "kubernetes_deployment" "youtube_clone_deployment" {
  metadata {
    name      = "youtube-clone-deployment"
    namespace = kubernetes_namespace.youtube_clone.metadata[0].name
    labels = {
      app = "youtube-clone"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "youtube-clone"
      }
    }

    template {
      metadata {
        labels = {
          app = "youtube-clone"
      }
      }
      spec {
        container {
          name  = "youtube-clone"
          image = "taylorbree/youtube-clone:v1"

          port {
            container_port = 80
          }
        }
      }
    }
  }
}


resource "kubernetes_service" "youtube_clone_service" {
  metadata {
    name      = "youtube-clone-service"
    namespace = kubernetes_namespace.youtube_clone.metadata[0].name
  }

  spec {
    selector = {
      app = "youtube-clone"
    }

    type = "LoadBalancer"

    port {
      protocol    = "TCP"
      port        = 80
      target_port = 80
    }
  }
}
