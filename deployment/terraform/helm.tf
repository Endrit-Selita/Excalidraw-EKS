# nginx ingress

resource "helm_release" "nginx_ingress" {
  name       = "nginx-ingress-controller"
  repository = "https://helm.nginx.com/stable"
  chart      = "nginx-ingress-controller"

  create_namespace = true
  namespace        = "nginx-ingress-controller"

  depends_on = [module.eks]
}

# Cert Manager
resource "helm_release" "cert-manager" {
  name       = "cert-manager"
  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  version    = "v1.16.0"

  create_namespace = true
  namespace        = "cert-manager"

  values = [file("${path.module}/deployment/helm-values/cert-manager.yaml")]

}

# external dns
resource "helm_release" "external-dns" {
  name       = "external-dns"
  repository = "https://kubernetes-sigs.github.io/external-dns/"
  chart      = "external-dns"

  create_namespace = true
  namespace        = "external-dns"

  values = [file("${path.module}/deployment/helm-values/external-dns.yaml")]

}