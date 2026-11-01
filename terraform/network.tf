resource "yandex_vpc_network" "main" {
  name = "main"
}

resource "yandex_vpc_subnet" "public_sub" {
  name           = "public-subnet"
  zone           = "ru-central1-d"
  network_id     = yandex_vpc_network.main.id
  v4_cidr_blocks = ["10.0.1.0/24"]
}


resource "yandex_vpc_security_group" "sg" {
  name        = "sg"
  network_id  = yandex_vpc_network.main.id

  ingress {
    protocol       = "ANY"
    description    = "Allow from anywhere"
    v4_cidr_blocks = ["0.0.0.0/0"]
    from_port      = 0
    to_port        = 65535
  }

  egress {
    protocol       = "ANY"
    description    = "Allow all outbound traffic"
    v4_cidr_blocks = ["0.0.0.0/0"]
    from_port      = 0
    to_port        = 65535
  }
}

# resource "yandex_vpc_subnet" "private_sub" {
#   name           = "private-subnet"
#   zone           = "ru-central1-b"
#   network_id     = yandex_vpc_network.main.id
#   v4_cidr_blocks = ["10.0.10.0/24"]
#   route_table_id = yandex_vpc_route_table.nat_rt.id
# }

# resource "yandex_vpc_gateway" "nat_gw" {
#   name = "nat-gateway"
#   shared_egress_gateway {}
# }

# resource "yandex_vpc_route_table" "nat_rt" {
#   name       = "nat-route-table"
#   network_id = yandex_vpc_network.main.id

#   static_route {
#     destination_prefix = "0.0.0.0/0"
#     gateway_id         = yandex_vpc_gateway.nat_gw.id
#   }
# }