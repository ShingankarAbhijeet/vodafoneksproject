resource "kubernetes_namespace" "exaname" {
  metadata {
    name = "dev"
  }
}