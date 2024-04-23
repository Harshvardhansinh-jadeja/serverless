# resource "aws_dynamodb_table" "harshvardhan-dynamo-db" {
#   name           = "Harshvardhan_Student_Data"
#   billing_mode   = "PROVISIONED"
#   read_capacity  = 5
#   write_capacity = 5
#   hash_key       = "studentId"

#   attribute {
#     name = "studentId"
#     type = "S"
#   }

#   tags = {
#     Name        = "Harshvardhan_Student_data"
#     Environment = var.env
#   }
# }
