provider "aws" {
  region     = "eu-west-2"
}

resource "aws_s3_bucket" "lambda-exercise" {
  bucket = "lambda-exercise"
  acl    = "private"
}

resource "aws_lambda_function" "test_lambda" {
  function_name = "lambda_function_name"
  s3_bucket = "lambda-exercise"
  s3_key = "lambda.zip"
  role          = aws_iam_role.iam_lambda.arn
  handler       = "lambda_handler"
  runtime = "python3.7"

  environment {
    variables = {
      greeting = "Hello-lambda-greeting"
    }
  }
}

resource "aws_iam_role" "iam_lambda" {
  name = "test_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}


# terraform init
# terraform plan
# terraform apply

# AWS -> services -> lambda -> manage functions -> test_lambda -> test -> check the output

