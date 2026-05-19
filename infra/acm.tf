resource "aws_acm_certificate" "site" {
  provider          = aws.us_east_1
  domain_name       = "*.${var.bucket_name}"
  validation_method = "DNS"

  subject_alternative_names = [
    var.bucket_name,
  ]

  lifecycle {
    create_before_destroy = true
  }
}

locals {
  # ACM returns the same validation record for both *.domain and domain — deduplicate by record name
  acm_validation_records = {
    for k, v in {
      for dvo in aws_acm_certificate.site.domain_validation_options : dvo.resource_record_name => {
        name  = dvo.resource_record_name
        value = dvo.resource_record_value
        type  = dvo.resource_record_type
      }...
    } : k => v[0]
  }
}

resource "cloudflare_record" "acm_validation" {
  for_each = local.acm_validation_records

  zone_id         = var.cloudflare_zone_id
  name            = each.value.name
  content         = each.value.value
  type            = each.value.type
  ttl             = 60
  proxied         = false
  allow_overwrite = true
}

resource "aws_acm_certificate_validation" "site" {
  provider                = aws.us_east_1
  certificate_arn         = aws_acm_certificate.site.arn
  validation_record_fqdns = [for record in cloudflare_record.acm_validation : record.hostname]
}
