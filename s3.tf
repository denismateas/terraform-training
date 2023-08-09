resource "aws_s3_bucket" "tt-bucket" {
      bucket = var.BUCKET_NAME
    }

resource "aws_s3_object" "s3-object" {
    bucket = aws_s3_bucket.tt-bucket.id
    source = var.PATH_VAR
    key = var.KEY_VAR
}

  resource "aws_s3_object" "tt-bucket-files" {
    bucket = aws_s3_bucket.tt-bucket.id
    key    = each.key
    source = "${path.module}/${each.value}"
  
    for_each = var.file_assets
  }