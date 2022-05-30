output "intance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.tfletcher_web.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.tfletcher_web.public_ip
}

output "cloudfront_url" {
  description = "URL of the cloudfront resourse"
  value       = aws_cloudfront_distribution.tfletcher_cloudfront.domain_name
}

output "s3_domain_name" {
  description = "Domain name of the S3 resource"
  value       = aws_s3_bucket.tfletcher_s3_bucket.bucket_regional_domain_name
}
