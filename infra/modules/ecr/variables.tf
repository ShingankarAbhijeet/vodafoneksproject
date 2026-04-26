variable "subnet" {
  default = ["172.31.32.0/20", "172.31.0.0/20"]
}
#############

variable "env" {
  type = list(string)
  default = ["dev", "qa", "staging", "prod"]  #"app-repo"]
  
}
variable "Project" {
  type = string
  default = "worldclassprodgrade"
}