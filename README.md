# Terraform VK Cloud MySQL Project

Проект создаёт в VK Cloud:

- Сеть, подсеть, роутер.
- MySQL 8.0 Single Instance.
- Базу данных `leskina_test_database`.

> Пользователи базы не создаются через Terraform (можно добавить вручную после создания).

---

## Структура проекта

db-terraform/
├─ main.tf 
├─ networks.tf 
├─ outputs.tf 
└─ init_db.py 


## Запуск Terraform
1. Инициализируем проекст
       terraform init
2. Применяем конфигурацию
       terraform apply
3. Получаем публичный IP MySQL (Он нам нужен для подключения к БД)
       terraform output
4. Устанавливаем необходимый пакет
       pip install mysql-connector-python
5. Запускаем скрипт
       python init_db.py



