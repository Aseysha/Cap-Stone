resource "aws_lambda_function" "song_crawler" {
  function_name = "song_crawler"
  filename      = "build/song-crawler.zip"
  role          = "arn:aws:iam::087020219185:role/LabRole"
  handler       = "crawler.handler"
  timeout       = 300
  runtime       = "python3.9"
  source_code_hash = filebase64sha256("build/song-crawler.zip")

}
