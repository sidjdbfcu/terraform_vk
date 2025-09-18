output "leskina_mysql_instance_id" {
  value = vkcs_db_instance.leskina_mysql_single.id
}

output "leskina_database_name" {
  value = vkcs_db_database.leskina_test_db.name
}
