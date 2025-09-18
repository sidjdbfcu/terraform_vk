data "vkcs_compute_flavor" "db" {
  name = "STD3-2-8" 
}
resource "vkcs_db_instance" "leskina_mysql_single" {
  name        = "leskina-mysql"
  flavor_id   = data.vkcs_compute_flavor.db.id
  size        = 20
  volume_type = "ceph-ssd"

  datastore {
    type    = "mysql"
    version = "8.0"
  }

  network {
    uuid = vkcs_networking_network.leskina_db_network.id
  }
  floating_ip_enabled = true
  availability_zone = "ME1"

  depends_on = [
    vkcs_networking_router_interface.leskina_db_router_interface
  ]
}
resource "time_sleep" "wait_for_mysql" {
  depends_on = [vkcs_db_instance.leskina_mysql_single]
  create_duration = "60s"
}
resource "vkcs_db_database" "leskina_test_db" {
  name    = "leskina_test_database"
  dbms_id = vkcs_db_instance.leskina_mysql_single.id

  depends_on = [time_sleep.wait_for_mysql]
}
