resource "aws_dynamodb_table" "facts_dynamodb_table" {
  name             = "Facts-dynamodb-table"
  hash_key         = "facts_id"
  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"
  billing_mode     = "PROVISIONED"
  read_capacity    = 25
  write_capacity   = 25

  attribute {
    name = "facts_id"
    type = "S"
  }

    tags = {
    Name        = "Facts-dynamodb-table"
  }
}
