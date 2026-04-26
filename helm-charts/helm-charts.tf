resource "helm_release" "argocd" {
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  version          = "6.11.1"   # use latest compatible with your k8s version
  namespace        = "argocd"
  create_namespace = true
  values = [
    file("${path.module}/values/argocd-values.yaml")
  ]

  # Ensure CRDs are installed first (Helm handles this if crds are in crds/ folder)
  set {
    name  = "installCRDs"
    value = true
  }
}

# Optional: Create an initial App‑of‑Apps (empty scaffold)
resource "kubernetes_manifest" "app_of_apps" {
  depends_on = [helm_release.argocd]
  manifest   = {
    apiVersion = "argoproj.io/v1alpha1"
    kind       = "Application"
    metadata = {
      name      = "platform-apps"
      namespace = "argocd"
      finalizers = ["resources-finalizer.argocd.argoproj.io"]
    }
    spec = {
      project = "default"
      source = {
        repoURL        = "https://github.com/your-org/app-team-gitops-repo.git"
        targetRevision = "HEAD"
        path           = "apps"
      }
      destination = {
        server    = "https://kubernetes.default.svc"
        namespace = "argocd"
      }
      syncPolicy = {
        automated = {
          prune    = true
          selfHeal = true
        }
        syncOptions = ["CreateNamespace=true"]
      }
    }
  }
}