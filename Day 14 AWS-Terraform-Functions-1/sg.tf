resource "aws_security_group" "allow_all" {
  name        = "${var.vpc_name}-allow-all"
  description = "Allow all Inbound traffic"
  vpc_id      = aws_vpc.default.id

  # Ingress rule block with dynamic iteration over service_ports
  dynamic "ingress" {
    for_each = var.ingress_value
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]  # Allow traffic from any IP
    }
  }

  # Egress rule block
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # Allow outbound traffic to any IP
  }

  # Tags block
  tags = {
    Name        = "${var.vpc_name}-allow-all"
    Owner       = local.Owner
    costcenter  = local.costcenter
    TeamDL      = local.TeamDL
    environment = var.environment
  }
}
