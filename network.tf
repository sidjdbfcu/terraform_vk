resource "vkcs_networking_network" "leskina_db_network" {
  name           = "leskina-db-network"
  admin_state_up = true
}

resource "vkcs_networking_subnet" "leskina_db_subnet" {
  name            = "leskina-db-subnet"
  network_id      = vkcs_networking_network.leskina_db_network.id
  cidr            = "192.168.100.0/24"
  enable_dhcp     = true
  dns_nameservers = ["8.8.8.8", "8.8.4.4"]
}

data "vkcs_networking_network" "extnet" {
  name = "internet"
}

resource "vkcs_networking_router" "leskina_db_router" {
  name                = "leskina-db-router"
  external_network_id = data.vkcs_networking_network.extnet.id
  admin_state_up      = true
}

resource "vkcs_networking_router_interface" "leskina_db_router_interface" {
  router_id = vkcs_networking_router.leskina_db_router.id
  subnet_id = vkcs_networking_subnet.leskina_db_subnet.id
}
