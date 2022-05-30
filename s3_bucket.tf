resource "aws_s3_bucket" "tfletcher_s3_bucket" {
  bucket = "tfletcher12345678"

  tags = {
    Name        = "tfletcher_s3_bucket"
    Environment = "Dev"
  }
}


resource "aws_s3_bucket_acl" "tfletcher_s3_acl" {
  bucket = aws_s3_bucket.tfletcher_s3_bucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket_versioning" "tfletcher_s3_versioning" {
  bucket = aws_s3_bucket.tfletcher_s3_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}


resource "aws_s3_object" "tfletcher_s3_object" {
  bucket = aws_s3_bucket.tfletcher_s3_bucket.bucket
  key    = "tosin.jpg"
  source = "/home/tfletcher/files/tosin.jpg"
  acl    = "public-read"
}


resource "aws_s3_bucket_public_access_block" "tfletcher_s3_public_access" {
  bucket = aws_s3_bucket.tfletcher_s3_bucket.id

  block_public_acls   = false
  block_public_policy = false
}
