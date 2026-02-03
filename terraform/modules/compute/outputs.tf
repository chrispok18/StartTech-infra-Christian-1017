output "alb_security_group_id" {
  value = aws_security_group.alb.id
}

output "ec2_security_group_id" {
  value = aws_security_group.ec2.id
}

output "target_group_arn" {
  value = aws_lb_target_group.backend.arn
}

output "alb_dns_name" {
  value = aws_lb.app.dns_name
}

output "instance_profile_name" {
  value = aws_iam_instance_profile.ec2_profile.name
}
