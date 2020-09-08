#  Lambda Example Project:

This help us build the lambda function using Terraform script.
More information about the Terraform and AWS follow the documentation pages:
Terraform AWS provider: [Terraform Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)


##  Terraform commands:

* run `terraform --version` to check the version
* run `terraform init` to initialize.
* run `terraform plan` to execution plan

*separate paragraph*

(base) arushis-mbp:Glaswall Solutions arunkumar$ `terraform plan`

  Refreshing Terraform state in-memory prior to plan...
  The refreshed state will be used to calculate this plan, but will not be
  persisted to local or remote state storage.

aws_iam_role.iam_lambda: Refreshing state... [id=test_role]

 ![alt text](https://github.com/Malvearun/unknown/blob/master/screenprint.png "terraform plan")
  
  

* run `terraform apply` to see it work.
Outputs:

 Lambda = arn:aws:lambda:eu-west-2:xxxxxxx:function:hello-lambda-greeting:$LATEST

Try to invoke the lambda function to file-output.txt:

* run `aws lambda invoke--function -name hello-lambda-greeting output.txt`

To see the output function:

* run `cat output.txt`

"{} from Lambda function!"


# AWS console -> services -> lambda -> manage functions -> test_lambda -> test -> check the output
run terraform destroy to clean up.

Reference  [Lambda-api-gateway](https://learn.hashicorp.com/tutorials/terraform/lambda-api-gateway)


