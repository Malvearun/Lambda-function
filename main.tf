provider "aws" {
  region     = "eu-west-2"
  access_key = "AKIA56KP4NDAIS3CJPPQ"
  secret_key = "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"
}

resource "aws_s3_bucket" "Lambda-exercise" {
  bucket = "Lambda-exercise"
  acl    = "private"
}

resource "aws_lambda_function" "test_lambda" {
  function_name = "lambda_function_name"
  s3_bucket = "Lambda-exercise"
  s3_key = "lambda.zip"
  role          = aws_iam_role.iam_lambda.arn
  handler       = "lambda_handler"
  runtime = "python 3.7"

  environment {
    variables = {
      greeting = "Hello Lambda"
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

# aws s3api create-bucket --bucket=lambda-exercise --region=eu-west-2
# zip lambda.zip
# aws s3 cp lambda.zip s3://lambda-exercise/lambda.zip
# terraform init
# terraform plan
# terraform apply

# AWS -> services -> lambda -> manage functions -> test_lambda -> test -> check the output

