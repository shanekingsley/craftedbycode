# Import existing craftedbycode.co.uk AWS resources into Terraform state.
# Run: terraform init && terraform plan
# Review the plan — it should show imports only, zero changes.
# Then: terraform apply
# After apply succeeds, this file can be deleted.

import {
  to = aws_s3_bucket.site
  id = "craftedbycode.co.uk"
}

import {
  to = aws_s3_bucket_ownership_controls.site
  id = "craftedbycode.co.uk"
}

import {
  to = aws_s3_bucket_public_access_block.site
  id = "craftedbycode.co.uk"
}

import {
  to = aws_s3_bucket_website_configuration.site
  id = "craftedbycode.co.uk"
}

import {
  to = aws_s3_bucket_policy.site
  id = "craftedbycode.co.uk"
}

import {
  to = aws_cloudfront_distribution.cdn
  id = "EVGJO2DCIGD0F"
}
