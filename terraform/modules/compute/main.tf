data "aws_ssm_parameter" "amazon_linux" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

resource "aws_security_group" "workload" {
  name        = "${var.project_name}-${var.environment}-workload"
  description = "No inbound access; HTTPS egress for Systems Manager and updates."
  vpc_id      = var.vpc_id

  egress {
    description = "HTTPS egress for Systems Manager and package repositories"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-${var.environment}-workload-sg"
  })
}

resource "aws_instance" "workload" {
  ami                         = data.aws_ssm_parameter.amazon_linux.value
  instance_type               = var.instance_type
  subnet_id                   = var.private_subnet_id
  vpc_security_group_ids      = [aws_security_group.workload.id]
  iam_instance_profile        = var.instance_profile
  associate_public_ip_address = false

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  root_block_device {
    encrypted             = true
    volume_type           = "gp3"
    volume_size           = 8
    delete_on_termination = true
  }

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-${var.environment}-workload"
  })
}
