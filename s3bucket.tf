#create s3 bucket
resource "aws_s3_bucket" "sravani-webapp-s3-demo" {
  bucket = "sravani-webapp-demo"
}

#enable versioning
resource "aws_s3_bucket_versioning" "sravani-webapp-s3-versioning" {
  bucket = aws_s3_bucket.sravani-webapp-s3-demo.id
  versioning_configuration {
    status = "Enabled"
  }
}