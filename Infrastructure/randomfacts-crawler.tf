resource "aws_lambda_function" "facts_crawler" {
  function_name = "Facts_crawler"
  filename      = "build/facts-crawler.zip"
  role          = "arn:aws:iam::087020219185:role/LabRole"
  handler       = "facts_crawler.lambda_handler"
  timeout       = 300
  runtime       = "python3.9"
  source_code_hash = filebase64sha256("build/facts-crawler.zip")

}
