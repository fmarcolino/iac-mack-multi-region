output "region_1_tls_private_key" {
  value     = module.system_on_region_1.tls_private_key
  sensitive = true
}

output "region_1_instance_ips" {
  value = module.system_on_region_1.instance_ips
}

output "region_1_database_url" {
  value = module.system_on_region_1.database_url
}

output "region_1_elb_url" {
  value = module.system_on_region_1.elb_url
}

output "region_1_vpc_id" {
  value = module.system_on_region_1.vpc_id
}

output "region_2_tls_private_key" {
  value     = module.system_on_region_2.tls_private_key
  sensitive = true
}

output "region_2_instance_ips" {
  value = module.system_on_region_2.instance_ips
}

output "region_2_database_url" {
  value = module.system_on_region_2.database_url
}

output "region_2_elb_url" {
  value = module.system_on_region_2.elb_url
}

output "region_2_vpc_id" {
  value = module.system_on_region_2.vpc_id
}
