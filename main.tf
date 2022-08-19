provider "aws" {
  region     = "us-east-1"
  access_key = "AKIARLGGPM6KIF2BYTNK"
  secret_key = "4f/z4jr0lK2XtYeYx9fznA3z7oyS2h4iS7fAbYLK"
}

resource "aws_s3_bucket" "terraform_state_s3" {
  bucket = "bucket_name_to_replace" 
  force_destroy = true

  versioning {
         enabled = true
        }


server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "TerraFom111-up-and-run-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
        attribute {
         name = "LockID"
         type = "S"
      }
}
