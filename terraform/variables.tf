variable "project_name" {
  default = "expense"
}

variable "environment" {
  default = "dev"
}

variable "comman_tags" {
  default = {
    Project="expense"
    Environment="dev"
    Terraform=true
    Component="frontend"
  }
}
variable "zone_name" {
  default = "naveencloud.online"
}
variable "app_version" {
  
}