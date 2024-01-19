terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.25.2"
    }
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
}
