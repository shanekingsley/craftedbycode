# Rewrites directory-style request URIs (e.g. /apps/snapchat/) to the underlying
# S3 object key (/apps/snapchat/index.html). Needed because the private-bucket
# OAC origins expose the raw S3 REST API, which — unlike an S3 website endpoint —
# has no concept of a directory index document. Associated with every OAC
# distribution in this repo (prod, and staging once it moves to OAC).

resource "aws_cloudfront_function" "rewrite_index" {
  name    = "${replace(var.bucket_name, ".", "-")}-rewrite-index"
  runtime = "cloudfront-js-2.0"
  comment = "Append index.html to directory-style request URIs"
  publish = true
  code    = file("${path.module}/functions/rewrite-index.js")
}