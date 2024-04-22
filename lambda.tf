data "archive_file" "lambda_zip" {
  type        = "zip"
  source_dir  = "./backend"
  output_path = "lambda_function.zip"
}

resource "aws_lambda_function" "Harshvardhan_Lambda_backend" {
  function_name    = "Harshvardhan_Lambda_backend"
  role             = aws_iam_role.Harshvardhan_Lambda_Role.arn
  handler          = "lambda_function.lambda_handler"
  filename         = data.archive_file.lambda_zip.output_path
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
  runtime          = "python3.12"
}