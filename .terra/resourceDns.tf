resource "digitalocean_domain" "maurobernal" {
  name = "maurobernal.ar"
}

# Add a record to the domain
resource "digitalocean_record" "www" {
  domain = digitalocean_domain.maurobernal.name
  type   = "A"
  name   = "blazor"
  ttl    = "30"
  value  = kubernetes_service.service.status[0].load_balancer[0].ingress[0].ip
}

