output "bucket_name" {
  value = aws_s3_bucket.site.bucket
}

output "cloudfront_distribution_id" {
  value = aws_cloudfront_distribution.cdn.id
}

output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.cdn.domain_name
}

output "staging_bucket_name" {
  value = aws_s3_bucket.staging.bucket
}

output "staging_cloudfront_distribution_id" {
  value = aws_cloudfront_distribution.staging.id
}

output "staging_cloudfront_domain_name" {
  value = aws_cloudfront_distribution.staging.domain_name
}
