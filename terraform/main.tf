provider "kubernetes" {
  config_path = "C:/Users/bmd tech/.kube/config"
}

resource "kubernetes_manifest" "mon-portfolio-deployment" {
  manifest = yamldecode(file("../kubernetes/web_deploy.yml"))
}

resource "kubernetes_manifest" "mon-portfolio-service" {
  manifest = yamldecode(file("../kubernetes/web_service.yml"))
}






















# provider "kubernetes" {
#   config_path = "~/.kube/config"
# }
# resource "kubernetes_manifest" "mon-portfolio-deployment" {
#   manifest = yamldecode(file("../kubernetes/web_deploy.yml"))
# }

# # resource "kubernetes_manifest" "deployment2" {
# #   manifest = yamldecode(file("../kubernetes/db-deployment.yml"))
# # }

# resource "kubernetes_manifest" "mon-portfolio-service" {
#   manifest = yamldecode(file("../kubernetes/web_service.yml"))
# }
# # resource "kubernetes_manifest" "web-service" {
# #   manifest = yamldecode(file("../kubernetes/web-service.yml"))
# # }