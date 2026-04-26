module "eks" {
  source = "./infra/modules/eks"
  
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