resource "aws_cloudwatch_log_group" "backend" {
  name              = "/starttech/prod/backend"
  retention_in_days = 7
}
