# ==============================================================================
# CONFIGURATION DE BASE TERRAFORM - SEANCE 3
# ==============================================================================

# 1. Déclaration des dépendances requises (Le Provider)
terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.5.1"
    }
  }
}

# 2. Déclaration de notre ressource cible
resource "local_file" "dns_config" {
  filename = "/tmp/dns_config.txt"
  content  = "nameserver 192.168.56.100\nnameserver 8.8.8.8"
}
