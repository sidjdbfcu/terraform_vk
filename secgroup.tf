resource "vkcs_networking_secgroup" "main_sg" {
  name = "SecGroup-Leskina"
}

resource "vkcs_networking_secgroup_rule" "allow_traffic" {
  count = 3
  security_group_id = vkcs_networking_secgroup.main_sg.id
  direction = "ingress"
  protocol = "tcp"
  port_range_min = element([22,80,443], count.index)
  port_range_max = element([22,80,443], count.index)
  remote_ip_prefix = "0.0.0.0/0"

}

resource "vkcs_networking_secgroup_rule" "allow_dns" {
  security_group_id = vkcs_networking_secgroup.main_sg.id
  direction = "egress"
  protocol = "udp"
  port_range_min = 53
  port_range_max = 53
  remote_ip_prefix = "0.0.0.0/0"

}