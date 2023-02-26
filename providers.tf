provider "aws" {
  region  = var.region_1_name
  alias   = "region_1"
}

provider "aws" {
  region  = var.region_2_name
  alias   = "region_2"
}
