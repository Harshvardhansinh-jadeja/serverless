resource "aws_api_gateway_rest_api" "harshvardhan-rest-api" {
  name = "Harshvardhan_Student_API"
  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

# -------------------
#    FIRST API
# -------------------

resource "aws_api_gateway_resource" "students_resource" {
  path_part   = "students"
  parent_id   = aws_api_gateway_rest_api.harshvardhan-rest-api.root_resource_id
  rest_api_id = aws_api_gateway_rest_api.harshvardhan-rest-api.id
}

resource "aws_api_gateway_method" "student_method" {
  rest_api_id      = aws_api_gateway_rest_api.harshvardhan-rest-api.id
  resource_id      = aws_api_gateway_resource.students_resource.id
  http_method      = "GET"
  api_key_required = false
  authorization    = "NONE"
}


resource "aws_api_gateway_method_response" "method_response" {
  rest_api_id = aws_api_gateway_rest_api.harshvardhan-rest-api.id
  resource_id = aws_api_gateway_resource.students_resource.id
  http_method = aws_api_gateway_method.student_method.http_method
  status_code = "200"
  response_models = {
    "application/json" = "Empty"
  }
}


resource "aws_api_gateway_integration" "students_integration" {
  rest_api_id             = aws_api_gateway_rest_api.harshvardhan-rest-api.id
  resource_id             = aws_api_gateway_resource.students_resource.id
  http_method             = aws_api_gateway_method.student_method.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.Harshvardhan_Lambda_backend.invoke_arn
}

# -------------------
#    HEALTH API
# -------------------

resource "aws_api_gateway_resource" "health_resource" {
  path_part   = "health"
  parent_id   = aws_api_gateway_rest_api.harshvardhan-rest-api.root_resource_id
  rest_api_id = aws_api_gateway_rest_api.harshvardhan-rest-api.id
}

resource "aws_api_gateway_method" "health_method" {
  rest_api_id      = aws_api_gateway_rest_api.harshvardhan-rest-api.id
  resource_id      = aws_api_gateway_resource.health_resource.id
  http_method      = "GET"
  api_key_required = false
  authorization    = "NONE"
}


resource "aws_api_gateway_method_response" "health_method_response" {
  rest_api_id = aws_api_gateway_rest_api.harshvardhan-rest-api.id
  resource_id = aws_api_gateway_resource.health_resource.id
  http_method = aws_api_gateway_method.health_method.http_method
  status_code = "200"
  response_models = {
    "application/json" = "Empty"
  }
}


resource "aws_api_gateway_integration" "health_integration" {
  rest_api_id             = aws_api_gateway_rest_api.harshvardhan-rest-api.id
  resource_id             = aws_api_gateway_resource.health_resource.id
  http_method             = aws_api_gateway_method.health_method.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.Harshvardhan_Lambda_backend.invoke_arn
}


# -------------------
#    SECOND API
# -------------------

resource "aws_api_gateway_resource" "student_resource" {
  path_part   = "student"
  parent_id   = aws_api_gateway_rest_api.harshvardhan-rest-api.root_resource_id
  rest_api_id = aws_api_gateway_rest_api.harshvardhan-rest-api.id
}


# -------------------
#    SECOND API POST
# -------------------

resource "aws_api_gateway_method" "student_Post_method" {
  rest_api_id      = aws_api_gateway_rest_api.harshvardhan-rest-api.id
  resource_id      = aws_api_gateway_resource.student_resource.id
  http_method      = "POST"
  api_key_required = false
  authorization    = "NONE"
}


resource "aws_api_gateway_method_response" "student_method_response" {
  rest_api_id = aws_api_gateway_rest_api.harshvardhan-rest-api.id
  resource_id = aws_api_gateway_resource.student_resource.id
  http_method = aws_api_gateway_method.student_Post_method.http_method
  status_code = "200"
  response_models = {
    "application/json" = "Empty"
  }
}


resource "aws_api_gateway_integration" "student_POST_integration" {
  rest_api_id             = aws_api_gateway_rest_api.harshvardhan-rest-api.id
  resource_id             = aws_api_gateway_resource.student_resource.id
  http_method             = aws_api_gateway_method.student_Post_method.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.Harshvardhan_Lambda_backend.invoke_arn
}


# -------------------
#    SECOND API GET
# -------------------

resource "aws_api_gateway_method" "student_GET_method" {
  rest_api_id      = aws_api_gateway_rest_api.harshvardhan-rest-api.id
  resource_id      = aws_api_gateway_resource.student_resource.id
  http_method      = "GET"
  api_key_required = false
  authorization    = "NONE"
}


resource "aws_api_gateway_method_response" "student_GET_method_response" {
  rest_api_id = aws_api_gateway_rest_api.harshvardhan-rest-api.id
  resource_id = aws_api_gateway_resource.student_resource.id
  http_method = aws_api_gateway_method.student_GET_method.http_method
  status_code = "200"
  response_models = {
    "application/json" = "Empty"
  }
}


resource "aws_api_gateway_integration" "student_GET_integration" {
  rest_api_id             = aws_api_gateway_rest_api.harshvardhan-rest-api.id
  resource_id             = aws_api_gateway_resource.student_resource.id
  http_method             = aws_api_gateway_method.student_GET_method.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.Harshvardhan_Lambda_backend.invoke_arn
}
# -------------------
#  SECOND API PATCH
# -------------------

resource "aws_api_gateway_method" "student_PATCH_method" {
  rest_api_id      = aws_api_gateway_rest_api.harshvardhan-rest-api.id
  resource_id      = aws_api_gateway_resource.student_resource.id
  http_method      = "PATCH"
  api_key_required = false
  authorization    = "NONE"
}


resource "aws_api_gateway_method_response" "student_PATCH_method_response" {
  rest_api_id = aws_api_gateway_rest_api.harshvardhan-rest-api.id
  resource_id = aws_api_gateway_resource.student_resource.id
  http_method = aws_api_gateway_method.student_PATCH_method.http_method
  status_code = "200"
  response_models = {
    "application/json" = "Empty"
  }
}


resource "aws_api_gateway_integration" "student_PATCH_integration" {
  rest_api_id             = aws_api_gateway_rest_api.harshvardhan-rest-api.id
  resource_id             = aws_api_gateway_resource.student_resource.id
  http_method             = aws_api_gateway_method.student_PATCH_method.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.Harshvardhan_Lambda_backend.invoke_arn
}
# -------------------
#    SECOND API DELETE
# -------------------

resource "aws_api_gateway_method" "student_DELETE_method" {
  rest_api_id      = aws_api_gateway_rest_api.harshvardhan-rest-api.id
  resource_id      = aws_api_gateway_resource.student_resource.id
  http_method      = "DELETE"
  api_key_required = false
  authorization    = "NONE"
}


resource "aws_api_gateway_method_response" "student_DELETE_method_response" {
  rest_api_id = aws_api_gateway_rest_api.harshvardhan-rest-api.id
  resource_id = aws_api_gateway_resource.student_resource.id
  http_method = aws_api_gateway_method.student_DELETE_method.http_method
  status_code = "200"
  response_models = {
    "application/json" = "Empty"
  }
}

resource "aws_api_gateway_integration" "student_DELETE_integration" {
  rest_api_id             = aws_api_gateway_rest_api.harshvardhan-rest-api.id
  resource_id             = aws_api_gateway_resource.student_resource.id
  http_method             = aws_api_gateway_method.student_DELETE_method.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.Harshvardhan_Lambda_backend.invoke_arn
}

# -------------------
#  SECOND API CORS OPTIONS
# -------------------

# OPTIONS HTTP method.
resource "aws_api_gateway_method" "student_OPTIONS_method" {
  rest_api_id      = aws_api_gateway_rest_api.harshvardhan-rest-api.id
  resource_id      = aws_api_gateway_resource.student_resource.id
  http_method      = "OPTIONS"
  authorization    = "NONE"
  api_key_required = false
}

# OPTIONS method response.
resource "aws_api_gateway_method_response" "Student_CORS" {
  rest_api_id = aws_api_gateway_rest_api.harshvardhan-rest-api.id
  resource_id = aws_api_gateway_resource.student_resource.id
  http_method = aws_api_gateway_method.student_OPTIONS_method.http_method
  status_code = "200"
  response_models = {
    "application/json" = "Empty"
  }
  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = true
    "method.response.header.Access-Control-Allow-Methods" = true
    "method.response.header.Access-Control-Allow-Origin"  = true
  }
}

# OPTIONS integration.
resource "aws_api_gateway_integration" "student_integration_OPTIONS" {
  rest_api_id          = aws_api_gateway_rest_api.harshvardhan-rest-api.id
  resource_id          = aws_api_gateway_resource.student_resource.id
  http_method          = "OPTIONS"
  type                 = "MOCK"
  passthrough_behavior = "WHEN_NO_MATCH"
  request_templates = {
    "application/json" : "{\"statusCode\": 200}"
  }
   depends_on = [
    aws_api_gateway_method.student_OPTIONS_method,
    aws_api_gateway_method_response.Student_CORS
  ]
}

# OPTIONS integration response.
resource "aws_api_gateway_integration_response" "student_integration_response_OPTIONS" {
  rest_api_id = aws_api_gateway_rest_api.harshvardhan-rest-api.id
  resource_id = aws_api_gateway_resource.student_resource.id
  http_method = aws_api_gateway_integration.student_integration_OPTIONS.http_method
  status_code = "200"
  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = "'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token'"
    "method.response.header.Access-Control-Allow-Methods" = "'POST,OPTIONS,DELETE,PATCH'"
    "method.response.header.Access-Control-Allow-Origin"  = "'*'"
  }
  depends_on = [ aws_api_gateway_integration.student_integration_OPTIONS ]
}


# -------------------
#  LAMBDA PERMISSION
# -------------------

resource "aws_lambda_permission" "apigw_lambda" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.Harshvardhan_Lambda_backend.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.harshvardhan-rest-api.execution_arn}/*/*/*"
}


# -------------------
#  DEPLOYMENT
# -------------------

resource "aws_api_gateway_deployment" "Harshvardhan_Student_API_deployment" {
  rest_api_id = aws_api_gateway_rest_api.harshvardhan-rest-api.id
  triggers = {
    redeployment = sha1(jsonencode([
      aws_api_gateway_resource.students_resource.id,
      aws_api_gateway_method.student_method.id,
      aws_api_gateway_integration.students_integration.id,
      aws_api_gateway_integration_response.student_integration_response_OPTIONS.id
    ]))
  }
  lifecycle {
    create_before_destroy = true
  }
}

# -------------------
#   STAGE
# -------------------

resource "aws_api_gateway_stage" "Harshvardhan_Stage" {
  deployment_id = aws_api_gateway_deployment.Harshvardhan_Student_API_deployment.id
  rest_api_id   = aws_api_gateway_rest_api.harshvardhan-rest-api.id
  stage_name    = "Dev"
}