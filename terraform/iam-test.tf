resource "aws_iam_policy" "policy_resource_fail" {
  name        = "policy with *"
  path        = "/"
  description = "policy with *"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:*",
        ]
        Effect   = "Allow"
        Resource = "arn:aws:ec2:*"
      },
      {
        Action = [
          "s3:*",
        ]
        Effect   = "Allow"
        Resource = "arn:aws:s3:::some_bucket"
      }
    ]
  })
  tags = {
    yor_trace = "1d173543-e8d3-46e2-9ed5-b86be9ee3c22"
  }
}

resource "aws_iam_policy" "policy_resource_pass" {
  name        = "policy with *"
  path        = "/"
  description = "policy with *"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:*",
        ]
        Effect   = "Allow"
        Resource = "arn:aws:ec2:us-east-1:etcetc"
      },
      {
        Action = [
          "s3:*",
        ]
        Effect   = "Allow"
        Resource = "arn:aws:s3:::some_bucket"
      }
    ]
  })
  tags = {
    yor_trace = "afe2e5fc-38e1-4e10-a726-7e7b53c5bdbe"
  }
}

data "aws_iam_policy_document" "policy_data_fail" {
  statement {
    sid = "1"

    actions = [
      "s3:ListAllMyBuckets",
      "s3:GetBucketLocation",
    ]

    resources = [
      "arn:aws:s3:::*",
    ]
  }

  statement {
    actions = [
      "s3:ListBucket",
    ]

    resources = [
      "arn:aws:s3:::${var.s3_bucket_name}",
    ]
  }
}

data "aws_iam_policy_document" "policy_data_pass" {
  statement {
    sid = "1"

    actions = [
      "s3:ListAllMyBuckets",
      "s3:GetBucketLocation",
    ]

    resources = [
      "arn:aws:s3:::${var.s3_bucket_name}",
    ]
  }

  statement {
    actions = [
      "s3:ListBucket",
    ]

    resources = [
      "arn:aws:s3:::${var.s3_bucket_name}",
    ]
  }
}