#!/usr/bin/env bash
set -euo pipefail

ALB_URL="http://starttech-prod-alb-540102761.eu-west-1.elb.amazonaws.com/health"
echo "Checking: ${ALB_URL}"
curl -sS "${ALB_URL}"
echo
