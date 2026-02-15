# nginx ingress
resource "helm_release" "nginx_ingress" {
  name       = "nginx-ingress"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"

  create_namespace = true
  namespace        = "nginx-ingress"

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

  values = [file("${path.module}/../helm-values/cert-manager.yaml")]
  
  depends_on = [
    helm_release.nginx_ingress,       
    module.cert_manager_pod_identity
  ]

}

# external dns
resource "helm_release" "external-dns" {
  name       = "external-dns"
  repository = "https://kubernetes-sigs.github.io/external-dns/"
  chart      = "external-dns"

  create_namespace = true
  namespace        = "external-dns"

  values = [file("${path.module}/../helm-values/external-dns.yaml")]
 
  depends_on = [
    helm_release.nginx_ingress,       
    module.external_dns_pod_identity
  ]

}

# external argocd
resource "helm_release" "argocd_deploy" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "7.7.0"
  timeout    = "600"

  create_namespace = true
  namespace        = "argocd"

  values = [file("${path.module}/../helm-values/argocd.yaml")]

  depends_on = [
      helm_release.nginx_ingress,
      helm_release.cert-manager,
      helm_release.external-dns
    ]

}

# kubernetes prometheus stack
resource "helm_release" "kube_prom_stack" {
  name       = "k8s-prom-stack"
  repository = "https://prometheus-community.github.io/helm-charts" # from https://artifacthub.io/packages/helm/prometheus-community/kube-prometheus-stack
  chart      = "kube-prometheus-stack"

  create_namespace = true
  namespace        = "monitoring"

  values = [file("${path.module}/../helm-values/prometheus_grafana.yaml")]
  
  depends_on = [
      helm_release.nginx_ingress,
      helm_release.cert-manager,
      helm_release.external-dns
    ]
}
