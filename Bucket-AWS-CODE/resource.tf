resource "aws_s3_bucket" "bucket-test" {
    bucket = "bucketglobal-csv-nascimento"

    tags = {
        Name = "Bucket-test"
        Environment = "Terraform-code"
    }
}
