variable "subnet" {
  default = ["172.31.32.0/20", "172.31.0.0/20"]
}
#############

variable "env" {
  type = list(string)
  default = ["dev", "prod", "addons"]  #"app-repo"]
  
}
variable "Project" {
  type = string
  default = "worldclassprodgrade"
}

variable "tags" {
  default = {
    managed_by = "Terraform"
  }
}