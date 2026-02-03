variable "project_name" {
  type        = string
  description = "Project name prefix"
}

variable "environment" {
  type        = string
  description = "Environment name (e.g. prod)"
}

variable "aws_region" {
  type        = string
  description = "AWS region"
}
