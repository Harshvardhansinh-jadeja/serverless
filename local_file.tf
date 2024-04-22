resource "local_file" "env_file" {
  content  = "REACT_APP_API_INVOKE_URL=${aws_api_gateway_deployment.Harshvardhan_Student_API_deployment.invoke_url}"
  filename = "./frontend/.env"
}