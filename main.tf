module "eks" {
  source = "./infra/modules/eks"
  cluster_role_arn = aws_iam_role.cluster.arn
}
module "ecr" {
  source = "./infra/modules/ecr"
}
/*
module "k8s-resources" {
  source = "./k8s-reources/"
}
*/

############