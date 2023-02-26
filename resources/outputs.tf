output "tls_private_key" {
  description = "Private key for instance access (all instances)"
  value     = tls_private_key.this.private_key_pem
  sensitive = true
}

output "instance_ips" {
  value = aws_instance.main.*.public_ip
}

output "database_url" {
  value = aws_db_instance.main.address
}

output "elb_url" {
  value = aws_lb.lb_main.dns_name
}

output "vpc_id" {
  value = aws_vpc.main.id
}
