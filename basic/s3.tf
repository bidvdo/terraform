# <your-name>-bucket01
# <your-name>-bucket02 
# in Sing region
resource "aws_s3_bucket" "tf_s3_bucket01" {
  bucket = "sonyhp-bucket01"

  tags = {
    Product     = "Product01"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "tf_s3_bucket02" {
  bucket = "sonyhp-bucket02"

  tags = {
    Product     = "Product01"
    Environment = "Dev01"
    A           = "1"
    B           = "2"
  }
}
