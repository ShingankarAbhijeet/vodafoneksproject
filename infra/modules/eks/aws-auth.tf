/*
resource "kubernetes_config_map" "aws_auth" {
  metadata {
    name      = "aws-auth"
    namespace = "kube-system"
  }

  data = {
    mapRoles = <<YAML
- rolearn: arn:aws:iam::314133462348:role/github-actions-prod
  username: github-actions
  groups:
    - system:masters
YAML
  }
}
*/