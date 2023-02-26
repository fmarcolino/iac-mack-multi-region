variable "region_1_name" {
  description = "Region 1 name"

  default = "us-east-2"
}

variable "region_2_name" {
  description = "Region 2 name"

  default = "sa-east-1"
}

variable "project" {
  description = "Project name"

  default = "Multi-Region"
}

variable "cidr_block" {
  description = "Base CIDR for VPC"

  default = "172.26.0.0/16"
}
