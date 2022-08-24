resource "aws_s3_bucket" "pavneet-bucket11"{

  bucket = "pavneet-bucket11"
  
  tags= {
    Name = "pavneet-bucket11"
  }
}

resource "aws_s3_bucket_acl" "acl-bucket" {
  bucket = aws_s3_bucket.pavneet-bucket11.id
  acl    = "private"
}

resource "aws_iam_role" "proj-role" {
  name = "Proj-Role"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

resource "aws_iam_instance_profile" "proj-profile" {
  name = "Proj-profile"
  role = "${aws_iam_role.proj-role.name}"
}

resource "aws_iam_role_policy" "my-policy" {
 name = "my-policy"
 role = "${aws_iam_role.proj-role.id}"


 policy = <<-EOF
 {
   "Version": "2012-10-17",
   "Statement": [
     {
       "Sid": "AccessObject",
       "Effect": "Allow",
       "Action": [
         "s3:GetObject"
       ],
      "Resource": [
        "arn:aws:s3:::pavneet-bucket11"
      ]
     }
   ]
 }
EOF
}

