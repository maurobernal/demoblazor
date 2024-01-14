resource "kubernetes_deployment" "demoblazor" {
  metadata {
    name      = "deploy-maurobernal-blazor"
    namespace = kubernetes_namespace.maurobernal.metadata[0].name
    labels = {
      app = "deploy-maurobernal-blazor"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "deploy-maurobernal-blazor"
      }
    }

    template {
      metadata {
        labels = {
          app = "deploy-maurobernal-blazor"
        }
      }

      spec {
        container {

          name  = "container-maurobernal-blazor"
          image = "maurobernal/demoblazor:latest"

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }

          port {
            container_port = 80
          }
        }
      }
    }
  }
}
