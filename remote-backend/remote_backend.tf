S3 bucket to handle remote file
resource aws_s3_bucket my_bucket{

bucket="terra-k8s-remote-bucket-p"

}

# dynamoDB
resource "aws_dynamodb_table" "remote-dynamodb" {
  name           = "Remote-table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
