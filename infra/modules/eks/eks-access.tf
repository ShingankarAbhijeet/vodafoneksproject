
resource "aws_eks_access_entry" "github" {
  cluster_name  = aws_eks_cluster.example.name
  principal_arn = "arn:aws:iam::314133462348:role/github-actions-prod"
  type          = "STANDARD"
}

resource "aws_eks_access_policy_association" "github_admin" {
  cluster_name  = aws_eks_cluster.example.name
  principal_arn = "arn:aws:iam::314133462348:role/github-actions-prod"
 
  policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"

  access_scope {
    type = "cluster"
  }
}
