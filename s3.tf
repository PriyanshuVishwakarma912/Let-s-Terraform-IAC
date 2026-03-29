# This HCL file contains the S3 code


# this is resource block
resource aws_s3_bucket my_bucket{

bucket="sallu-bhai-s3-bucket"

}

# provider block
provider "aws" {

region= "us-west-2" 

}

