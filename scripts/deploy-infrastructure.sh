#!/usr/bin/env bash
set -euo pipefail

cd terraform
terraform fmt -recursive
terraform init
terraform validate
terraform plan
echo "If plan looks good, run: terraform apply"
