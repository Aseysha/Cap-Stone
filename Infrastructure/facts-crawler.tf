resource "aws_lambda_function" "facts_crawler" {
  function_name = "facts_crawler"
  filename      = "build/curiousfacts-crawler.zip"
  role          = "arn:aws:iam::087020219185:role/LabRole"
  handler       = "facts_crawler.lambda_handler"
  timeout       = 300
  runtime       = "python3.9"
  layers        = [aws_lambda_layer_version.lambda_layer.arn]
  source_code_hash = filebase64sha256("build/curiousfacts-crawler.zip")

}
resource "aws_lambda_layer_version" "lambda_layer" {
  filename   = "build/requests-layer.zip"
  layer_name = "lambda_layer"
  compatible_runtimes = ["python3.9"]
  source_code_hash = filebase64sha256("build/requests-layer.zip")
}
