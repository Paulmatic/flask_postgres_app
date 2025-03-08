resource "aws_s3_bucket" "flask_static" {
  bucket = "flask-static-bucket"

  tags = {
    Name = "flask-static"
  }
}
