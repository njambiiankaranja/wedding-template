resource "aws_iam_user" "wedding_deployer" {
  name = "ian-s3-deployer"
}

resource "aws_iam_policy" "wedding_s3_sync_policy" {
  name        = "WeddingS3SyncPolicy"
  description = "Least-privilege policy to sync files and manage the wedding S3 bucket"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:ListBucket"
        ]
        Resource = "arn:aws:s3:::wedding-template-static-hosting-20261016190256"
      },
      {
        Effect = "Allow"
        Action = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:DeleteObject"
        ]
        Resource = "arn:aws:s3:::wedding-template-static-hosting-20261016190256/*"
      }
    ]
  })
}

resource "aws_iam_user_policy_attachment" "attach_sync_policy" {
  user       = aws_iam_user.wedding_deployer.name
  policy_arn = aws_iam_policy.wedding_s3_sync_policy.arn
}