resource "aws_route_table_association" "public-subnets" {
  #   count          = 3
  count          = length(var.public_cird_block)
  subnet_id      = element(aws_subnet.public-subnet.*.id, count.index)
  route_table_id = aws_route_table.public-route-table.id
}


resource "aws_route_table_association" "private-subnets" {
  #   count          = 3
  count          = length(var.private_cird_block)
  subnet_id      = element(aws_subnet.private-subnet.*.id, count.index)
  route_table_id = aws_route_table.private-route-table.id
}

