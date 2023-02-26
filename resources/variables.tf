variable "project" {
  type = string
}

variable "cidr_block" {
  description = "Base CIDR for VPC"

  default = "172.26.0.0/16"
}
