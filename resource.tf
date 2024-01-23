resource "aws_s3_bucket" "bucket-test" {
    bucket = "unique-buckettest-caiosouza"

    tags = {
        Name = "Bucket-test"
        Environment = "Terraform-code"
    }
}
