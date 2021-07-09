output "subnet_id_webserver" {
  value = aws_subnet.webserver.id
}

output "subnet_id_consumer" {
  value = aws_subnet.consumer.id
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