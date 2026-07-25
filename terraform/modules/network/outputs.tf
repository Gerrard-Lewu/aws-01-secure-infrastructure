output "vpc_id" {
  value = aws_vpc.this.id
}

output "public_subnet_ids" {
  value = [for availability_zone in var.availability_zones : aws_subnet.public[availability_zone].id]
}

output "private_subnet_ids" {
  value = [for availability_zone in var.availability_zones : aws_subnet.private[availability_zone].id]
}

output "public_default_route_gateway_id" {
  description = "Internet Gateway target of the public default route. Used by the local security test suite."
  value       = aws_route.public_internet.gateway_id
}

output "private_default_route_nat_gateway_id" {
  description = "NAT Gateway target of the private default route. Used by the local security test suite."
  value       = aws_route.private_nat.nat_gateway_id
}

output "internet_gateway_id" {
  description = "Internet Gateway ID. Used by the local security test suite."
  value       = aws_internet_gateway.this.id
}

output "nat_gateway_id" {
  description = "Single NAT Gateway ID. Used by the local security test suite."
  value       = aws_nat_gateway.this.id
}

output "nat_gateway_subnet_id" {
  description = "Public subnet hosting the single NAT Gateway. Used by the local security test suite."
  value       = aws_nat_gateway.this.subnet_id
}

output "first_public_subnet_id" {
  description = "First public subnet ID. Used by the local security test suite."
  value       = aws_subnet.public[var.availability_zones[0]].id
}
