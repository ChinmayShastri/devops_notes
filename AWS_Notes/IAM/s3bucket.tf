#Create AWS S3 Bucket

resource "aws_s3_bucket" "levelup-s3bucket" {
  bucket = "levelup-bucket-141"
  
  tags = {
    Name = "levelup-bucket-141"
  }
}

resource "aws_s3_bucket_acl" "levelup_s3bucket_acl" {
  bucket = aws_s3_bucket.levelup-s3bucket.id
  acl    = "private"
}
