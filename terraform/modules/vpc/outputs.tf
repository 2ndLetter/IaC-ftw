output "subnet_id" {
  value = aws_subnet.this.id
}

output "rt_id" {
  value = aws_vpc.this.default_route_table_id
}

output "vpc_id" {
  value = aws_vpc.this.id
}

output "gw_id" {
  value = aws_internet_gateway.this.id
}

output "ami_id" {
  value = data.aws_ami.this.id
}