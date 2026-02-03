# Outputs will be added later

output "alb_dns_name" {
  value = module.compute.alb_dns_name
}
output "frontend_bucket_name" {
  value = module.storage.frontend_bucket_name
}

output "cloudfront_domain_name" {
  value = module.storage.cloudfront_domain_name
}

output "cloudfront_distribution_id" {
  value = module.storage.cloudfront_distribution_id
}
