# nginx ingress

resource "helm_release" "nginx_ingress" {
  name = "nginx-ingress-controller"
  repository = "https://helm.nginx.com/stable"
  chart = "nginx-ingress-controller"

  create_namespace = true
  namespace = "nginx-ingress-controller"
}

# Cert Manager
resource "helm_release" "cert-manager" {
  name = "cert-manager"
  repository = "https://charts.jetstack.io"
  chart = "cert-manager"
  version    = "v1.16.0"

  create_namespace = true
  namespace = "cert-manager"

}