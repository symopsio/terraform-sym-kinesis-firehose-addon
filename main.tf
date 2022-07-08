resource "aws_iam_policy" "this" {
  name = "SymKinesisFirehose${title(var.environment)}"
  path = "/sym/"

  description = "Addon policy granting access to Kinesis Firehose"
  policy      = <<EOT
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "firehose:PutRecord",
        "firehose:PutRecordBatch"
      ],
      "Resource": "*",
      "Condition": { "StringEquals": { "firehose:ResourceTag/${var.tag_name}": "${var.environment}" } }
    },
    {
      "Effect": "Allow",
      "Action": [
        "firehose:ListDeliveryStreams"
      ],
      "Resource": "*"
    }
  ]
}
EOT
}
