#!/usr/bin/env bash
set -euo pipefail

echo "Rollback strategy:"
echo "1) Re-upload previous backend artifact to S3:"
echo "   s3://starttech-prod-backend-artifacts-033504885956/backend/app"
echo "2) Trigger ASG instance refresh:"
echo "   aws autoscaling start-instance-refresh --region eu-west-1 --auto-scaling-group-name starttech-prod-asg"
