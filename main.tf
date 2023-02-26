module "system_on_region_1" {
  source = "./resources"

  project = "${var.project}-${title(var.region_1_name)}"

  providers = {
    aws = aws.region_1
  }
}

module "system_on_region_2" {
  source = "./resources"

  project = "${var.project}-${title(var.region_2_name)}"

  providers = {
    aws = aws.region_2
  }
}
