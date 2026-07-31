variable "aws_region" {
  type    = string
  default = "eu-west-2"
}

variable "aws_profile" {
  type    = string
  default = "terraform-craftedbycode"
}

variable "bucket_name" {
  type    = string
  default = "craftedbycode.co.uk"
}

variable "cloudflare_api_token" {
  type      = string
  sensitive = true
}

variable "cloudflare_zone_id" {
  type        = string
  default     = "876fcea7c38c553ce132283f03cf8143"
  description = "Cloudflare zone ID for craftedbycode.co.uk (found on the domain overview page). Defaulted so plans are deterministic — an empty value would force replacement of the ACM validation records."
}
