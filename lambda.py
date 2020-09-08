import os


def lambda_handler(event, context):
    return "{} from Lambda function!".format(os.environ['Good Day!'])


# reference: https://docs.aws.amazon.com/lambda/latest/dg/with-sns-create-package.html
