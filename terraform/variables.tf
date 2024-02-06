variable "project_name" {
  type    = string
  default = "roboshop"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "tags" {
  default = {
    Component = "catalogue"
  }
}
variable "common_tags" {
  default = {
    Project     = "roboshop"
    Enviornment = "dev"
    Terraform   = "true"
  }
}

variable "zone_name" {
  default = "daws86s.online"
}
variable "app_version" {

}

variable "iam_instance_profile" {
  default = "roboshopapp-role"
}
