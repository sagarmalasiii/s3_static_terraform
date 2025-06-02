resource "aws_s3_bucket_ownership_controls" "ownership" {
  bucket = aws_s3_bucket.terrafrombucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "publicaccess" {
  bucket = aws_s3_bucket.terrafrombucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.terrafrombucket.id
  acl    = "public-read"
}

resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.terrafrombucket.id
  key          = "index.html"
  source       = "index.html"
  content_type = "text/html"
  acl          = "public-read"
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.terrafrombucket.id

  index_document {
    suffix = "index.html"
  }

  routing_rules = <<EOF
[{
    "Condition": {
        "KeyPrefixEquals": "docs/"
    },
    "Redirect": {
        "ReplaceKeyPrefixWith": ""
    }
}]
EOF
}

resource "aws_s3_bucket_policy" "public_read_access" {
  bucket = aws_s3_bucket.terrafrombucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = "*",
        Action    = [ "s3:GetObject" ],
        Resource  = "${aws_s3_bucket.terrafrombucket.arn}/*"
      }
    ]
  })
}
