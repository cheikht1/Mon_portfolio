provider "kubernetes" {
  config_path = "C:/Users/bmd tech/.kube/config"
}

# Déploiement de l'application web
resource "kubernetes_manifest" "mon-portfolio-deployment" {
  manifest = yamldecode(file("../kubernetes/web_deploy.yml"))
}

resource "kubernetes_manifest" "mon-portfolio-service" {
  manifest = yamldecode(file("../kubernetes/web_service.yml"))
}

# Déploiement de Prometheus
resource "kubernetes_manifest" "prometheus-config" {
  manifest = yamldecode(file("../kubernetes/prometheus/prometheus-config.yml"))
}

resource "kubernetes_manifest" "prometheus-deployment" {
  manifest = yamldecode(file("../kubernetes/prometheus/prometheus-deployment.yml"))
}

resource "kubernetes_manifest" "prometheus-service" {
  manifest = yamldecode(file("../kubernetes/prometheus/prometheus-service.yml"))
}

# Déploiement de Grafana
resource "kubernetes_manifest" "grafana-deployment" {
  manifest = yamldecode(file("../kubernetes/grafana/grafana-deployment.yml"))
}

resource "kubernetes_manifest" "grafana-service" {
  manifest = yamldecode(file("../kubernetes/grafana/grafana-service.yml"))
}
