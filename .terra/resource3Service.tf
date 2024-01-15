resource "kubernetes_service" "service" {
  metadata {
    name      = "service-maurobernal-blazor"
    namespace = kubernetes_namespace.maurobernal.metadata[0].name
  }
  spec {
    selector = {
      app = kubernetes_deployment.demoblazor.metadata[0].labels.app
    }
    session_affinity = "ClientIP"
    port {
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}
