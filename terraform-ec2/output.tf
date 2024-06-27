output "instance_ip" {
    value = aws_instance.web.public_ip
}

/*
output "subnet_names" {
  value = local.subnet_names
}

output "subnet_ids" {
  value = aws_subnet.subnet[*].id
}
*/