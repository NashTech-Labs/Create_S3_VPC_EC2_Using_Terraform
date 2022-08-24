provider "aws"{
  region     = "us-east-1"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
}

module "vpc"{
source= "./vpc"
}

module "instance"{
source= "./instance"
sub= module.vpc.vpc_id
sub2= module.bucket.iam_instance_profile
sub3= module.vpc.vpc_subnet_id
}

module "bucket"{
source= "./bucket"
}

