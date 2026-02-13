# nginx ingress

resource "helm_release" "nginx_ingress" {
  name = "nginx-ingress-controller"
  repository = "https://helm.nginx.com/stable"
  chart = "nginx-ingress-controller"

  create_namespace = true
  namespace = "nginx-ingress-controller"
}

# Cert Manager
resource "helm_release" "cert_manager" {
  name = "ngcert_manager"
  repository = "https://charts.jetstack.io"
  chart = "cert_manager"

  create_namespace = true
  namespace = "cert_manager"
}