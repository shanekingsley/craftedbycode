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
  default     = ""
  description = "Cloudflare zone ID for craftedbycode.co.uk (found on the domain overview page). Required for apply, not needed for CI output reads."
}
