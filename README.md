### How to create S3+VPC+EC2 using Modules in Terraform

Modules in terraform, allow using various resources together as a group. Also, these resources are reusable. They are available to use for other configurations as well.

In variables.tf, mention the access key and secret key as per the aws configuration of your system

```
variable "aws_access_key" {
  default= "your_own_access_key"
}
variable "aws_secret_key" {
default= "your_own_secret_key"
}
```

After this, run the following commands to complete the setup

`terraform init`

`terraform plan`

`terraform apply`
