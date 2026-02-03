resource "aws_security_group" "redis" {
  name        = "${var.project_name}-${var.environment}-redis-sg"
  description = "Redis security group"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Redis from backend EC2"
    from_port       = 6379
    to_port         = 6379
    protocol        = "tcp"
    security_groups = [var.backend_security_group_id]
  }

  egress {
    description = "All outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-redis-sg"
  }
}

resource "aws_elasticache_subnet_group" "redis" {
  name       = "${var.project_name}-${var.environment}-redis-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "${var.project_name}-${var.environment}-redis-subnet-group"
  }
}

resource "aws_elasticache_replication_group" "redis" {
  replication_group_id = "${var.project_name}-${var.environment}-redis"
  description          = "Redis for ${var.project_name}-${var.environment}"
  engine               = "redis"
  engine_version       = var.redis_engine_version
  node_type            = var.redis_node_type
  port                 = 6379

  subnet_group_name  = aws_elasticache_subnet_group.redis.name
  security_group_ids = [aws_security_group.redis.id]

  # Simple + cost-friendly: 1 node (no replicas)
  num_cache_clusters         = 1
  automatic_failover_enabled = false
  multi_az_enabled           = false

  tags = {
    Name = "${var.project_name}-${var.environment}-redis"
  }
}
