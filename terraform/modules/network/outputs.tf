output "vpc_id" {
  value = aws_vpc.this.id
}

output "public_subnet_ids" {
  value = [for availability_zone in var.availability_zones : aws_subnet.public[availability_zone].id]
}

output "private_subnet_ids" {
  value = [for availability_zone in var.availability_zones : aws_subnet.private[availability_zone].id]
}
